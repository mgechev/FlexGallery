package net.mgechev.business.picturecontrol
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	import net.mgechev.vo.ProfileVO;
	
	public class UploadDelegate
	{
		
		private var responder:IResponder;
		private var service:URLRequest;
		
		public function UploadDelegate(responder:IResponder) 
		{			
			this.responder = responder;
			this.service = new URLRequest("./scripts/index.php?page=upload");
		}
		
		public function upload(file:FileReference):void 
		{		
			file.upload(service);
			file.addEventListener(Event.COMPLETE, responder.result);
		}
		
	}
}