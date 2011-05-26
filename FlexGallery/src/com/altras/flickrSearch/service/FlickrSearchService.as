package com.altras.flickrSearch.service
{
	import com.altras.flickrSearch.controller.SearchCommand;
	import com.altras.flickrSearch.service.events.FlickrSearchResultEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.robotlegs.mvcs.Actor;
	
	public class FlickrSearchService extends Actor implements IFlickrSearchService
	{
		private static const FLICKR_SEARCH_API_POINT:String="http://api.flickr.com/services/rest/?method=flickr.photos.search";
		private static const FLICKR_API_KEY:String="";
		private var _service:HTTPService;
		private var _parser:IFlickrSearchResultParser;
		public function FlickrSearchService()
		{
			super();
			_service = new HTTPService();
		}
		
		public function getSearchResult(term:String):void
		{
			trace("FlickrSearchService getSearchResult");
			_service.url = FLICKR_SEARCH_API_POINT + "&api_key=" +
				FLICKR_API_KEY + "&tags=" + term;
			_service.addEventListener(ResultEvent.RESULT, onServiceResult);
			_service.addEventListener(FaultEvent.FAULT, onServiceFault);
			}
		[Inject]
		public function set parser(value:IFlickrSearchResultParser):void
		{
			_parser = value;
		}
		private function onServiceResult(event:ResultEvent):void{
			_service.removeEventListener(ResultEvent.RESULT, onServiceResult);
			_service.removeEventListener(FaultEvent.FAULT, onServiceFault);
			
			if(event.result.rsp.stat != "ok") {
				dispatch(new FlickrSearchResultEvent(FlickrSearchResultEvent.ON_ERROR));
			}
			trace("FlickrSearchService result");
			dispatch(new FlickrSearchResultEvent(FlickrSearchResultEvent.ON_RESULT,_parser.parseSearchResult(event.result.rsp.photos.photo as ArrayCollection)));
		}
		private function onServiceFault(event:ResultEvent):void {
			_service.removeEventListener(ResultEvent.RESULT, onServiceResult);
			_service.removeEventListener(FaultEvent.FAULT, onServiceFault);
			dispatch(new FlickrSearchResultEvent(FlickrSearchResultEvent.ON_ERROR));		
			
		}
	}
}