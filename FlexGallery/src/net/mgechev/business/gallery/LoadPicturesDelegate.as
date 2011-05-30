package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;

	public class LoadPicturesDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService
		public var parameter:Object;
		
		public function LoadPicturesDelegate(responder:IResponder, parameter:Object = null)
		{
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getPicturesService");
		}
		
		public function execute():void
		{
			var userId:int = parameter.userId;
			var page:uint = parameter.pageNumber;
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