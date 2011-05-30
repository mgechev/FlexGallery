package net.mgechev.commands.picturecontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.picturecontrol.UploadDelegate;
	import net.mgechev.events.picturecontrol.UploadEvent;
	import net.mgechev.model.ViewModelLocator;

	public class UploadCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		public var currentFile:FileReference;
		private var delegate:UploadDelegate;
		
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
			delegate = new UploadDelegate(this, currentFile);
			modelLocator.pushService(delegate);
		}
		
		
		public function result(event:Object):void
		{
			modelLocator.filesUploaded[currentFile] = true;
			modelLocator.uploadProgress++;
			modelLocator.dequeue(delegate);
			modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			Alert.show("asdasd");
		}
	}
}