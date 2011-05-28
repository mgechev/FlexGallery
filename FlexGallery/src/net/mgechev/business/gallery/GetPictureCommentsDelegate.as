package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	public class GetPictureCommentsDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function GetPictureCommentsDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getPictureCommentService");
		}
		
		public function getComments(pictureId:uint):void 
		{			
			var token:AsyncToken = this.service.send( {id:pictureId} );
			token.addResponder(responder); 
		}
	}
}