package net.mgechev.commands.picturecontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.picturecontrol.UploadDelegate;
	import net.mgechev.events.picturecontrol.UploadEvent;
	import net.mgechev.model.ViewModelLocator;

	public class UploadCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var currentFile:FileReference;
		private var delegate:UploadDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			if (modelLocator.filesUploaded == null)
			{
				modelLocator.filesUploaded = new Dictionary();
			}
			var uploadEvent:UploadEvent = event as UploadEvent;
			modelLocator.filesUploaded[uploadEvent.picture] = false;
			currentFile = uploadEvent.picture;
			delegate = new UploadDelegate(this, currentFile);
			
			delegatesQueue.registerDelegate(delegate);
		}
		
		
		public function result(event:Object):void
		{
			modelLocator.filesUploaded[currentFile] = true;
			modelLocator.uploadProgress++;
			
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}