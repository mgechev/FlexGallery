package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.view.gallery.gallery.Gallery;
	import net.mgechev.view.gallery.gallery.GalleryLogic;
	
	public class StartSlideShowEvent extends CairngormEvent
	{
		public static const START_SLIDE_SHOW_EVENT:String = "StartSlideShow";
		public var gallery:GalleryLogic;
		
		
		public function StartSlideShowEvent(gallery:GalleryLogic)
		{
			this.gallery = gallery;
			super(START_SLIDE_SHOW_EVENT);
		}
		
		override public function clone():Event
		{
			return new StartSlideShowEvent(gallery);
		}
	}
}