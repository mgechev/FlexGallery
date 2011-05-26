package com.altras.flickrSearch.service.events
{
	import flash.events.Event;
	
	public class FlickrSearchResultEvent extends Event
	{
		public static const ON_RESULT:String = "ON_RESULT";
		public static const ON_ERROR:String = "ON_ERROR";
		public var _data:Array;
		public function FlickrSearchResultEvent(type:String, data:Array=null)
		{
			super(type, bubbles, cancelable);
			_data = data; 
		}
		override public function clone():Event {
			return new FlickrSearchResultEvent(FlickrSearchResultEvent.ON_RESULT,_data);
			
	}
}
}