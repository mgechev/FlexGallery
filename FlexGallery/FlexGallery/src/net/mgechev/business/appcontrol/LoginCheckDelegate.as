package net.mgechev.business.appcontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	public class LoginCheckDelegate
	{
		
		public var responder:IResponder;
		public var service:HTTPService;
		
		public function LoginCheckDelegate(responder:IResponder)
		{
			this.responder = responder;
			service = ServiceLocator.getInstance().getHTTPService("loginCheckService");
		}
		
		public function check():void
		{
			var token:AsyncToken = service.send();
			token.addResponder(responder);
		}
		
	}
}