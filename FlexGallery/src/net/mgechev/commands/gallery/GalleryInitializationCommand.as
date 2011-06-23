package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.events.gallery.GalleryInitializationEvent;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class GalleryInitializationCommand implements ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var galleryEvent:GalleryInitializationEvent = 
				event as GalleryInitializationEvent;
			if (!galleryEvent.gallery.isUserpanelEnabled)
			{
				var loadPictures:LoadPicturesEvent = new LoadPicturesEvent(0);
				loadPictures.dispatch();
				galleryEvent.gallery.selectedUserId = -1;
			}
			galleryEvent.gallery.focusEnabled = true;
		}
	}
}