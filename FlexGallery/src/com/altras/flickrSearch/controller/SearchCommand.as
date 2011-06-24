package com.altras.flickrSearch.controller
{
	import com.altras.flickrSearch.events.ImageSearchEvent;
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.model.parsers.IFlickrSearchResultParser;
	import com.altras.flickrSearch.service.IFlickrService;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Command;

	public class SearchCommand extends Command
	{
		[Inject]
		public var model:FlickrSearchModel;
		[Inject]
		public var imageSearchEvent:ImageSearchEvent;
		[Inject]
		public var service:IFlickrService;
		[Inject]
		public var searchResultParser:IFlickrSearchResultParser;
		
		override public function execute():void
		{
			trace("SearchCommand execute");
			
			service.searchByTag(imageSearchEvent._term, new AsyncResponder(searchByTagResult, searchByTagFault));
		}
		
		public function searchByTagResult(result:ResultEvent, token:Object=null):void
		{
			trace("SearchCommand searchByTagResult");
			
			model.data = searchResultParser.parseSearchResult(result.result as XML);
		}
		
		public function searchByTagFault(error:FaultEvent, token:Object=null):void
		{
			trace("SearchCommand searchByTagFault");
		}
		
	}
}