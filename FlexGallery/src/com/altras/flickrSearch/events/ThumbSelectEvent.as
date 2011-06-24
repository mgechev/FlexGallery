package com.altras.flickrSearch.events
{
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	
	import flash.events.Event;
	
	public class ThumbSelectEvent extends Event
	{
		public static const SELECT:String="SELECT";
		
		public var _data:FlickrThumbVO;
		
		public function ThumbSelectEvent(type:String, data:FlickrThumbVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{	
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		override public function clone():Event {
			return new ThumbSelectEvent(type,_data,bubbles,cancelable);
		}
		
	}
}