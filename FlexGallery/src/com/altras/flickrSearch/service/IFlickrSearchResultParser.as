package com.altras.flickrSearch.service
{
	import mx.collections.ArrayCollection;
	public interface IFlickrSearchResultParser
	{
		function parseSearchResult(result:ArrayCollection):Array;	
	}
}