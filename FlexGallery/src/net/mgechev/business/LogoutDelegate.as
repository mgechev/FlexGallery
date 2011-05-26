package net.mgechev.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.rpc.http.mxml.HTTPService;
	
	import net.mgechev.vo.LoginVO;
	
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
			var token:AsyncToken = this.service.send( {logoutUser:1} );
			token.addResponder(responder); 
		}
		
	}
}