package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import net.mgechev.view.gallery.gallery.Gallery;
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	public class GalleryInitializationEvent extends CairngormEvent
	{
		public static const GALLERY_INITIALIZATION_EVENT:String = "GalleryInitialization";	
		public var gallery:GalleryLogic;
		
		public function GalleryInitializationEvent(gallery:GalleryLogic)
		{
			this.gallery = gallery;
			super(GALLERY_INITIALIZATION_EVENT);
		}
		
	}
}