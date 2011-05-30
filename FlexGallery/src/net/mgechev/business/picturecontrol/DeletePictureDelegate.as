package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;
		
	public class DeletePictureDelegate implements IDelegate
	{
		private var responder:IResponder;
		private var service:mx.rpc.http.HTTPService;
		public var parameter:Object;
		
		public function DeletePictureDelegate(responder:IResponder, parameter:Object = null) 
		{
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("deletePictureService");
		}
		
		public function execute():void 
		{			
			var token:AsyncToken = this.service.send( {picture:parameter.toString()} );
			token.addResponder(responder); 
		}
		
	}
}