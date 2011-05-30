package net.mgechev.business.appcontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;

	public class LoginCheckDelegate implements IDelegate
	{
		
		public var responder:IResponder;
		public var service:HTTPService;
		public var parameter:Object;
		
		public function LoginCheckDelegate(responder:IResponder, parameter:Object = null)
		{
			this.responder = responder;
			this.parameter = parameter;
			service = ServiceLocator.getInstance().getHTTPService("loginCheckService");
		}
		
		public function execute():void
		{
			var token:AsyncToken = service.send();
			token.addResponder(responder);
		}
		
	}
}