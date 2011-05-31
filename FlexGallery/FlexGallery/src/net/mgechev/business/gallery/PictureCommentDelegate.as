package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.vo.CommentVO;

	public class PictureCommentDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function PictureCommentDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("sendCommentService");
		}
		
		public function comment(commentData:net.mgechev.vo.CommentVO):void 
		{			
			var token:AsyncToken = this.service.send( {id:commentData.id, content:commentData.content} );
			token.addResponder(responder); 
		}
		
	}
}