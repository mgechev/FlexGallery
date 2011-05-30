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
	
	public class LogoutDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function LogoutDelegate(responder:IResponder, parameter:Object = null) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("logoutService");
		}
		
		public function execute():void 
		{			
			var logout:uint = 1;
			var token:AsyncToken = this.service.send( {logoutUser:logout} );
			token.addResponder(responder); 
		}
		
	}
}