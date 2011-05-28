package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	public class LoadUserPicturesDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService
		
		public function LoadUserPicturesDelegate(responder:IResponder)
		{
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getUserPicturesService");
		}
		
		public function load(userId:uint):void
		{
			var token:AsyncToken = this.service.send({id:userId});
			token.addResponder(this.responder);
		}
	}
}