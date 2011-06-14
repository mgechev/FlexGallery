package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	
	import net.mgechev.view.gallery.Gallery;
	
	public class StopSlideShowEvent extends CairngormEvent
	{
		public static const STOP_SLIDE_SHOW_EVENT:String = "StopSlideShow";
		public var gallery:Gallery;
		
		
		public function StopSlideShowEvent(gallery:Gallery)
		{
			this.gallery = gallery;
			super(STOP_SLIDE_SHOW_EVENT);
		}
		
		override public function clone():Event
		{
			return new StopSlideShowEvent(gallery);
		}
	}
}