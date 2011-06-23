package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	
	import net.mgechev.events.gallery.StartSlideShowEvent;
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.view.gallery.gallery.Gallery;
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	import org.rockholla.utils.Window;

	public class StartSlideShowCommand implements ICommand
	{
		private var gallery:GalleryLogic;
		private var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var changePictureEvent:StartSlideShowEvent = 
				event as StartSlideShowEvent;
			gallery = changePictureEvent.gallery;
			
			ViewModelLocator.gallertHeightBackup = gallery.height;
			ViewModelLocator.gallertWidthBackup = gallery.width;
			ViewModelLocator.gallertXBackup = gallery.x;
			ViewModelLocator.gallertYBackup = gallery.y;
			
			gallery.x = 0;
			gallery.y = 0;
			gallery.percentWidth = 100;
			gallery.percentHeight = 100;
			
			gallery.inSlideshowState = true;
			gallery.currentState = "slideShowstate";
			gallery.stage.displayState = StageDisplayState.FULL_SCREEN;
			
			ViewModelLocator.inSlideshowState = true;
			ViewModelLocator.changeSlideShowPicture = new Timer(ViewModelLocator.SLIDESHOW_TIMEOUT, 0);
			ViewModelLocator.changeSlideShowPicture.addEventListener(TimerEvent.TIMER, changePicture);
			ViewModelLocator.changeSlideShowPicture.start();
			
			modelLocator.lastState = modelLocator.currentState;
			modelLocator.currentState = "slideShow";
		}
		
		private function changePicture(event:Event):void
		{
			if (!gallery.maximizeRightPicture())
			{
				var stopSlideshow:StopSlideShowEvent = new StopSlideShowEvent(gallery);
				stopSlideshow.dispatch();
			}
			gallery.show.play();
		}
	}
}