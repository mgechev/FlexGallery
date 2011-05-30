package net.mgechev.business.gallery
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import net.mgechev.business.IDelegate;

	public class LoadUserListDelegate implements IDelegate
	{
		private var service:mx.rpc.http.HTTPService;
		private var responder:IResponder;
		public var parameter:Object;
		
		public function LoadUserListDelegate(responder:IResponder, parameter:Object = null)
		{
			this.parameter = parameter;
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService("getUserListService");
		}
		
		public function execute():void
		{
			var token:AsyncToken = this.service.send();
			token.addResponder(this.responder);
		}
	}
}