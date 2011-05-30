package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.vo.CommentVO;

	public class PictureCommentDelegate implements IDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function PictureCommentDelegate(responder:IResponder, parameter:Object = null) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("sendCommentService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( {id:parameter.id, content:parameter.content} );
			token.addResponder(responder); 
		}
		
	}
}