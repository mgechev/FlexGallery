package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
		
	public class DeletePictureDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function DeletePictureDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("deletePictureService");
		}
		
		public function deletePicture(pictureName:String):void 
		{			
			var token:AsyncToken = this.service.send( {picture:pictureName} );
			token.addResponder(responder); 
		}
		
	}
}