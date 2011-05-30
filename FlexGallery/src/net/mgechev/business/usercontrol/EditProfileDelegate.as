package net.mgechev.business.usercontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.vo.ProfileVO;

	public class EditProfileDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function EditProfileDelegate(responder:IResponder, parameter:Object) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("editProfileService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( 
				{email:parameter.email,
				password:parameter.password,
				oldPassword:parameter.oldPassword} );
			token.addResponder(responder); 
		}
		
	}
}