package com.altras.flickrSearch.controller
{
	import com.altras.flickrSearch.controller.events.ImageSearchEvent;
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.service.FlickrSearchResultParser;
	import com.altras.flickrSearch.service.IFlickrSearchService;
	import com.altras.flickrSearch.service.events.FlickrSearchResultEvent;
	
	import flash.profiler.showRedrawRegions;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Command;

	public class SearchCommand extends Command
	{
		[Inject]
		public var model:FlickrSearchModel;
		[Inject]
		public var imageSearchEvent:ImageSearchEvent;
		[Inject]
		public var service:IFlickrSearchService;
		
		public function SearchCommand()
		{
			super();
		}
		override public function execute():void{
			trace("SearchCommand executed");
			eventDispatcher.addEventListener(FlickrSearchResultEvent.ON_ERROR,onFlickrSearchError);
			eventDispatcher.addEventListener(FlickrSearchResultEvent.ON_ERROR, onFlickrSearchResult);
		}
		private function onFlickrSearchError(event:FlickrSearchResultEvent):void{
			eventDispatcher.removeEventListener(FlickrSearchResultEvent.ON_ERROR, onFlickrSearchError);
			eventDispatcher.removeEventListener(FlickrSearchResultEvent.ON_RESULT,onFlickrSearchResult);
			Alert.show("Flickr Service Error","Error");
		}
		private function onFlickrSearchResult(event:FlickrSearchResultEvent):void{
			trace("SearchCommand FlickrSearchResult");
			eventDispatcher.removeEventListener(FlickrSearchResultEvent.ON_ERROR, onFlickrSearchError);
			eventDispatcher.removeEventListener(FlickrSearchResultEvent.ON_RESULT,onFlickrSearchResult);
			model.data = event._data;
		}
	}
}