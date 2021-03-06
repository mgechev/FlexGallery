package net.mgechev.business.usercontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.rpc.http.mxml.HTTPService;
	
	import net.mgechev.vo.UserVO;
	
	public class LogoutDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function LogoutDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("logoutService");
		}
		
		public function logout():void 
		{			
			var logout:uint = 1;
			var token:AsyncToken = this.service.send( {logoutUser:logout} );
			token.addResponder(responder); 
		}
		
	}
}