package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.events.gallery.GalleryInitializationEvent;
	import net.mgechev.events.gallery.GalleryKeyPressedEvent;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class GalleryKeyPressedCommand implements ICommand
	{
		public function GalleryKeyPressedCommand()
		{
		}
		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var galleryEvent:GalleryKeyPressedEvent = 
				event as GalleryKeyPressedEvent;

			var galleryKeyEvent:KeyboardEvent = 
				event as KeyboardEvent;

			if (galleryKeyEvent.keyCode == 37)
			{
				galleryEvent.gallery.maximizeLeftPicture();
			}
			if (galleryKeyEvent.keyCode == 39)
			{
				galleryEvent.gallery.maximizeRightPicture();
			}
			if (galleryKeyEvent.keyCode == Keyboard.END)
			{
				Alert.show("asdasd");
				var stopSlideshow:StopSlideShowEvent = new StopSlideShowEvent(galleryEvent.gallery);
				stopSlideshow.dispatch();
			}
		}
	}
}