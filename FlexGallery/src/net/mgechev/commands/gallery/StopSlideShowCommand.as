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
	import net.mgechev.view.gallery.gallery.Gallery;
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	import org.osmf.traits.ViewableTrait;
	
	public class StopSlideShowCommand implements ICommand
	{
		private var gallery:GalleryLogic;
		private var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var stopSlideShow:StopSlideShowEvent = event as StopSlideShowEvent;
			gallery = stopSlideShow.gallery;
			ViewModelLocator.inSlideshowState = false;
			stopSlideshow();		
		}
		
		public function stopSlideshow():void
		{
			gallery.stage.displayState = StageDisplayState.NORMAL;
			ViewModelLocator.changeSlideShowPicture.stop();
			
			modelLocator.currentState = modelLocator.lastState;
			
			gallery.currentState = "normalState";
			gallery.inSlideshowState = false;
			gallery.height = ViewModelLocator.gallertHeightBackup;
			gallery.width = ViewModelLocator.gallertWidthBackup;
			gallery.x = ViewModelLocator.gallertXBackup;
			gallery.y = ViewModelLocator.gallertYBackup;
		}
		
	}
}