package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;

	public class GetPictureDetailsDelegate implements IDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function GetPictureDetailsDelegate(responder:IResponder, parameter:Object) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getPictureCommentService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( {id:parameter} );
			token.addResponder(responder); 
		}
	}
}