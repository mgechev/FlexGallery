package net.mgechev.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.vo.EditProfileVO;

	public class EditProfileDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function EditProfileDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("editProfileService");
		}
		
		public function editProfile(editPrifileData:EditProfileVO):void 
		{			
			var token:AsyncToken = this.service.send( 
				{email:editPrifileData.email,
				password:editPrifileData.password,
				oldPassword:editPrifileData.oldPassword} );
			token.addResponder(responder); 
		}
		
	}
}