package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.vo.CommentVO;
	
	public class PictureVoteDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		
		public function PictureVoteDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("sendVoteService");
		}
		
		public function vote(pictureId:uint, rating:uint):void 
		{			
			var token:AsyncToken = this.service.send( {id:pictureId, vote:rating} );
			token.addResponder(responder); 
		}
		
	}
}