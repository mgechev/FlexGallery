package com.altras.flickrSearch.service.impl
{
	import com.altras.flickrSearch.service.IFlickrService;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class FlickrServiceImpl implements IFlickrService
	{
		private static const FLICKR_SEARCH_API_POINT:String="http://api.flickr.com/services/rest/?method=flickr.photos.search";
		private static const FLICKR_API_KEY:String="397ca1c9126bbd1d81ecca2a32688c97";
		
		private var service:HTTPService = new HTTPService();
		
		public function searchByTag(tags:String, responder:IResponder):AsyncToken
		{
			service.url = FLICKR_SEARCH_API_POINT + "&api_key=" + FLICKR_API_KEY + "&tags=" + tags;
			service.method = "GET";
			service.resultFormat = "e4x";
			
			var asyncToken:AsyncToken = service.send();
			asyncToken.addResponder(responder);
			return asyncToken;
		}
		
	}
}