package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	
	import net.mgechev.view.gallery.gallery.Gallery;
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	public class GalleryKeyPressedEvent extends CairngormEvent 
	{
		public static const GALLERY_KEY_PRESSED_EVENT:String = "GalleryKeyPressed";	
		public var gallery:GalleryLogic;
		
		public function GalleryKeyPressedEvent(gallery:GalleryLogic)
		{
			this.gallery = gallery;
			super(GALLERY_KEY_PRESSED_EVENT);
		}
		
	}
}