package com.altras.flickrSearch.model.parsers
{
	import mx.collections.ArrayCollection;
	
	public interface IFlickrSearchResultParser
	{
		function parseSearchResult(result:XML):Array;	
		
	}
}