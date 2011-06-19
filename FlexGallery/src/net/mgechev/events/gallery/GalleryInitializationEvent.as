package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import net.mgechev.view.gallery.Gallery;
	
	public class GalleryInitializationEvent extends CairngormEvent
	{
		public static const GALLERY_INITIALIZATION_EVENT:String = "GalleryInitialization";	
		public var gallery:Gallery;
		
		public function GalleryInitializationEvent(gallery:Gallery)
		{
			this.gallery = gallery;
			super(GALLERY_INITIALIZATION_EVENT);
		}
		
	}
}