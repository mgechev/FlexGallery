package com.altras.flickrSearch.controller.events
{
	import flash.events.Event;
	
	import mx.controls.Image;
	
	public class ImageSearchEvent extends Event
	{
		public static const SEARCH:String="SEARCH";
		public var _term:String;
		public function ImageSearchEvent(type:String, term:String)
		{
			super(type, bubbles, cancelable);
			_term = term;
		}
		override public function clone():Event
		{
			return new ImageSearchEvent(type,_term);
		}
	}
}