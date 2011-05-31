package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class EditCommentDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function EditCommentDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("editCommentService");
		}
		
		public function editComment(pictureId:uint, comment:String):void 
		{			
			var token:AsyncToken = this.service.send( {id:pictureId, comment:comment} );
			token.addResponder(responder); 
		}
		
	}
}