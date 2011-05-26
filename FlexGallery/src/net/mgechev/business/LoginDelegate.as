package net.mgechev.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.rpc.http.mxml.HTTPService;
	
	import net.mgechev.vo.LoginVO;
	
	public class LoginDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function LoginDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("loginService");
		}
		
		public function login(loginData:net.mgechev.vo.LoginVO):void 
		{			
			var token:AsyncToken = this.service.send( {username:loginData.username, password:loginData.password} );
			token.addResponder(responder); 
		}
		
	}
}