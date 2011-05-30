package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.vo.CommentVO;
	
	public class PictureVoteDelegate implements IDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function PictureVoteDelegate(responder:IResponder, parameter:Object = null) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("sendVoteService");
		}
		
		public function execute():void 
		{
			var token:AsyncToken = this.service.send( {id:parameter.photoId, vote:parameter.rating} );
			token.addResponder(responder); 
		}
		
	}
}