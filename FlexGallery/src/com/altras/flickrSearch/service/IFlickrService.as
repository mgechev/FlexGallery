package com.altras.flickrSearch.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public interface IFlickrService
	{
		function searchByTag(tags:String, responder:IResponder):AsyncToken;
	}
}