package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.mgechev.events.gallery.StartSlideShowEvent;
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.view.gallery.Gallery;

	public class StartSlideShowCommand implements ICommand
	{
		private var gallery:Gallery;
		public function StartSlideShowCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var changePictureEvent:StartSlideShowEvent = 
				event as StartSlideShowEvent;
			gallery = changePictureEvent.gallery;
			gallery.inSlideshowState = true;
			gallery.currentState = "slideShowstate";
			gallery.stage.displayState = StageDisplayState.FULL_SCREEN;
			
			ViewModelLocator.inSlideshowState = true;
			ViewModelLocator.changeSlideShowPicture = new Timer(ViewModelLocator.SLIDESHOW_TIMEOUT, 0);
			ViewModelLocator.changeSlideShowPicture.addEventListener(TimerEvent.TIMER, changePicture);
			ViewModelLocator.changeSlideShowPicture.start();
			
		}
		
		private function changePicture(event:Event):void
		{
			gallery.hide.play();
			if (!gallery.maximizeRightPicture())
			{
				var stopSlideshow:StopSlideShowEvent = new StopSlideShowEvent(gallery);
				stopSlideshow.dispatch();
			}
			gallery.show.play();
		}
	}
}