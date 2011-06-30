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
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	public class GalleryKeyPressedCommand implements ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var galleryEvent:GalleryKeyPressedEvent = 
				event as GalleryKeyPressedEvent;
			
			dispachKeyPress(galleryEvent.keyCode, galleryEvent.gallery);
		}
		
		private function dispachKeyPress(keyCode:uint, gallery:GalleryLogic):void
		{
			if (keyCode == Keyboard.LEFT)
			{
				gallery.maximizeLeftPicture();
			}
			else if (keyCode == Keyboard.RIGHT)
			{
				gallery.maximizeRightPicture();
			}
		}
	}
}