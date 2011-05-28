package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	public class LoadUserListDelegate
	{
		private var service:mx.rpc.http.HTTPService;
		private var responder:IResponder;
		
		public function LoadUserListDelegate(responder:IResponder)
		{
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getUserListService");
		}
		
		public function load():void
		{
			var token:AsyncToken = this.service.send();
			token.addResponder(this.responder);
		}
	}
}