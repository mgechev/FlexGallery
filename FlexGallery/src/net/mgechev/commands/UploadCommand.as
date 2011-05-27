package net.mgechev.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.UploadDelegate;
	import net.mgechev.events.UploadEvent;
	import net.mgechev.model.ViewModelLocator;

	public class UploadCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		public var currentFile:FileReference;
		
		public function UploadCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (modelLocator.filesUploaded == null)
			{
				modelLocator.filesUploaded = new Dictionary();
			}
			var uploadEvent:UploadEvent = event as UploadEvent;
			modelLocator.filesUploaded[uploadEvent.picture] = false;
			currentFile = uploadEvent.picture;
			var delegate:UploadDelegate = new UploadDelegate(this);
			delegate.upload(currentFile);
		}
		
		
		public function result(event:Object):void
		{
			modelLocator.filesUploaded[currentFile] = true;
			modelLocator.uploadProgress++;
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}