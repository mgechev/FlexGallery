package net.mgechev.business.usercontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.vo.ProfileVO;
	
	public class RegistrationDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function RegistrationDelegate(responder:IResponder, parameter:Object) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("registrationService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( 
				{email:parameter.email,
					password:parameter.password,
					username:parameter.username} );
			token.addResponder(responder); 
		}
		
	}
}