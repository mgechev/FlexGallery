package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
	
	public class EditCommentDelegate implements IDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function EditCommentDelegate(responder:IResponder, parameter:Object = null) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("editCommentService");
		}
		
		public function execute():void 
		{			
			var pictureId:uint = parameter.photoId;
			var comment:String = parameter.comment.toString();
			var token:AsyncToken = this.service.send( {id:pictureId, comment:comment} );
			token.addResponder(responder); 
		}
		
	}
}