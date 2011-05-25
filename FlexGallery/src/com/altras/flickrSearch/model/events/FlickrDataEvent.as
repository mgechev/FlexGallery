package com.altras.flickrSearch.model.events
{
	import com.altras.flickrSearch.model.events.FlickrDataEvent;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	
	import flash.events.Event;

	public class FlickrDataEvent extends Event
	{
		public static const DATA_UPDATED:String = "DATA_UPDATED";
		public var _data:Array;
		public function FlickrDataEvent(type:String, data:Array)
		{
			super(type, bubbles, cancelable);
			_data = data;
		}
		override public function clone():Event{
			return new FlickrDataEvent(type,_data);
		}
	}
}