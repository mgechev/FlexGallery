package com.altras.flickrSearch.model.parsers.impl
{
	import com.altras.flickrSearch.model.parsers.IFlickrSearchResultParser;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	
	import mx.collections.ArrayCollection;
	
	public class FlickrSearchResultParserImpl implements IFlickrSearchResultParser
	{
		public function parseSearchResult(result:XML):Array
		{
			trace("FlickrSearchResultParserImpl parseSearchResult");
			
			var parsedResult:Array = [];
			
			for each (var item:XML in result.photos.photo) 
			{
				var thumbVO:FlickrThumbVO = new FlickrThumbVO();
				thumbVO.title = item.@title;
				thumbVO.link = "http://www.flickr.com/photos/"+item.@owner+"/"+item.@id;
				thumbVO.src = "http://farm"+item.@farm+".static.flickr.com/"+item.@server+"/"+item.@id+"_"+item.@secret+"_t.jpg";
				thumbVO.bigImageSrc = "http://farm"+item.@farm+".static.flickr.com/"+item.@server+"/"+item.@id+"_"+item.@secret+"_z.jpg";
				
				parsedResult.push(thumbVO);
			}
			return parsedResult;	
		}
		
	}
}