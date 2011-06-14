package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.view.gallery.Gallery;
	
	public class StopSlideShowCommand implements ICommand
	{
		private var gallery:Gallery;
		
		public function StopSlideShowCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var stopSlideShow:StopSlideShowEvent = event as StopSlideShowEvent;
			gallery = stopSlideShow.gallery;
			stopSlideshow();
		}
		
		public function stopSlideshow():void
		{
			gallery.stage.displayState = StageDisplayState.NORMAL;
			ViewModelLocator.changeSlideShowPicture.stop();
			gallery.currentState = "normalState";
			gallery.inSlideshowState = false;
		}
		
	}
}