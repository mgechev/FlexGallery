package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.view.gallery.Gallery;
	
	public class StartSlideShowEvent extends CairngormEvent
	{
		public static const START_SLIDE_SHOW_EVENT:String = "StartSlideShow";
		public var gallery:Gallery;
		
		
		public function StartSlideShowEvent(gallery:Gallery)
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