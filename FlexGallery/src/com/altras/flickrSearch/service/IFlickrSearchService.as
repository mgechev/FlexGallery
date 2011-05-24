package com.altras.flickrSearch.service
{
	public interface IFlickrSearchService
	{
		
		function getSearchResult(url:String):void;
		function set parser(value:IFlickrSearchResultParser):void;
		
	}
}