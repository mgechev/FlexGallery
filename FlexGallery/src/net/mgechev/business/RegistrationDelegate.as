package net.mgechev.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.vo.ProfileVO;
	
	public class RegistrationDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function RegistrationDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("registrationService");
		}
		
		public function register(registrationData:ProfileVO):void 
		{			
			var token:AsyncToken = this.service.send( 
				{email:registrationData.email,
					password:registrationData.password,
					username:registrationData.username} );
			token.addResponder(responder); 
		}
		
	}
}