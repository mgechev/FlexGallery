package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.IDelegate;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.ProfileVO;
	
	public class UploadDelegate implements IDelegate
	{
		
		private var responder:IResponder;
		private var service:URLRequest;
		public var parameter:Object;
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function UploadDelegate(responder:IResponder, parameter:Object = null) 
		{			
			this.parameter = parameter;
			this.responder = responder;
			this.service = new URLRequest("./scripts/index.php?page=upload&id=" + modelLocator.id);
		}
		
		public function execute():void 
		{					
			var file:FileReference = parameter as FileReference;
			file.upload(service);
			file.addEventListener(Event.COMPLETE, responder.result);
		}
		
	}
}