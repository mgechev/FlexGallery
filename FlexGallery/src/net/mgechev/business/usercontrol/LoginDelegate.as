package net.mgechev.business.usercontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.rpc.http.mxml.HTTPService;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.vo.UserVO;
	
	public class LoginDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function LoginDelegate(responder:IResponder, parameter:Object = null) 
		{
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("loginService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( {username:parameter.username, password:parameter.password} );
			token.addResponder(responder); 
		}
		
	}
}