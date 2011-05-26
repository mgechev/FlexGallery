package com.altras.flickrSearch.service
{
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	
	import mx.collections.ArrayCollection;
	
	public class FlickrSearchResultParser implements IFlickrSearchResultParser
	{
		public function FlickrSearchResultParser()
		{
		}
		
		public function parseSearchResult(result:ArrayCollection):Array
		{
			trace("FlickrSearchResultParser parsing result");
			var parsedResult:Array = new Array();
			var item:*;
			for each(item in result) {
				var thumbVO:FlickrThumbVO = new FlickrThumbVO();
				thumbVO.title = item.title;
				thumbVO.link ="http://www.flickr.com/photos/"+item.owner+"/"+item.id;
				thumbVO.src="http://farm"+item.farm+".static.flickr.com/"+item.server+"/"+item.id+"_"+item.secret+"_t.jpg";
				thumbVO.bigImageSrc="http://farm"+item.farm+".static.flickr.com/"+item.server+"/"+item.id+"_"+item.secret+"_z.jpg";
				parsedResult.push(thumbVO);
			}
			return parsedResult;	
		}
	}
}