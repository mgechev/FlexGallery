package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import net.mgechev.view.gallery.Gallery;
	
	public class GalleryKeyPressedEvent extends CairngormEvent
	{
		public static const GALLERY_KEY_PRESSED_EVENT:String = "GalleryKeyPressed";	
		public var gallery:Gallery;
		
		public function GalleryKeyPressedEvent(gallery:Gallery)
		{
			this.gallery = gallery;
			super(GALLERY_KEY_PRESSED_EVENT);
		}
		
	}
}