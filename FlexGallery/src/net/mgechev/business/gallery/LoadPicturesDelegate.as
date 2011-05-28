package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	public class LoadPicturesDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService
		
		public function LoadPicturesDelegate(responder:IResponder)
		{
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getPicturesService");
		}
		
		public function load(page:uint, userId:Number):void
		{
			var token:AsyncToken;
			if (userId != -1)
			{
 				token = this.service.send({id:userId, pageNumber:page});
			}
			else
			{				
				token = this.service.send({pageNumber:page});
			}
			token.addResponder(this.responder);
		}
	}
}