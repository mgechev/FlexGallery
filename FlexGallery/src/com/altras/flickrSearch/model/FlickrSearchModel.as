package com.altras.flickrSearch.model
{
	import com.altras.flickrSearch.model.events.FlickrDataEvent;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class FlickrSearchModel extends Actor
	{
		private var _selectedThumb:FlickrThumbVO;
		private var _data:Array;
		public function FlickrSearchModel()
		{
			super();
		}
		public function get selectedThumb():FlickrThumbVO{
			return _selectedThumb;
		}
		public function set selectedThumb(value:FlickrThumbVO):void{
			_selectedThumb = value;
			trace("selectedThumb set to model");
		}
		public function get data():Array {
			return _data;
		}
		public function set data(value:Array):void{
			trace("FlickrSearchModel data set");
			_data = value;
			dispatch(new FlickrDataEvent(FlickrDataEvent.DATA_UPDATED,_data));
		}
	}
}