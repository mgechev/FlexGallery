package net.mgechev.view.picturecontrol.uploadform
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.controls.List;
	import mx.controls.ProgressBar;
	import mx.effects.Fade;
	import mx.events.FlexEvent;
	import mx.printing.PrintAdvancedDataGrid;
	
	import net.mgechev.events.picturecontrol.UploadEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.PhotoVO;
	
	import spark.components.Button;
	import spark.components.Group;

	public class UploadFormLogic extends Group
	{
		
		private var hidePhotoList:Fade;
		private var showPhotoList:Fade;
				
		private var uploadedPhotosCount:Number = 0;
		
		[Bindable]
		public var notes:ArrayCollection;
		[Bindable]
		private var fileReferenceList:FileReferenceList;
		private var _progress:uint = 0;
		private var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public var selectFileButton:Button;
		public var uploadButton:Button;
		public var progressBar:ProgressBar;
		public var photosList:DataGrid;
		
		public function UploadFormLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			selectFileButton.addEventListener(MouseEvent.CLICK, selectFile);
		}
		
		public function set progress(p:uint):void
		{
			_progress = p;
			uploadedPhotosCount++;
			progressBar.setProgress((uploadedPhotosCount * 100) / fileReferenceList.fileList.length,
				progressBar.maximum);
		}
		
		//Browsing for files
		private function selectFile(event:Event):void 
		{
			fileReferenceList = new FileReferenceList();
			notes = new ArrayCollection();
			
			uploadButton.addEventListener(MouseEvent.CLICK, fileSelectedHandler);
			fileReferenceList.addEventListener(Event.SELECT, addFile);
			
			progressBar.setProgress(0, progressBar.maximum);
			uploadedPhotosCount = 0;
			modelLocator.uploadProgress = 0;
			
			fileReferenceList.browse();
		}
		
		private function addFile(event:Event):void
		{
			var fileReference:FileReference;
			var fileReferenceList:FileReferenceList = FileReferenceList(event.target);
			
			for (var i:Number = 0; i < fileReferenceList.fileList.length; i++) {
				
				fileReference = fileReferenceList.fileList[i] as FileReference;
				var photo:PhotoVO = new PhotoVO();
				photo.name = fileReference.name;
				photo.creator = fileReference.creator;
				photo.size = fileReference.size;
				notes.addItem(photo);
				
			}
			uploadButton.enabled = true;
		}
		
		private function fileSelectedHandler(event:Event):void 
		{					
			uploadButton.enabled = false;
			for (var i:Number = 0; i < fileReferenceList.fileList.length; i++) {
				var uploadEvent:UploadEvent = new UploadEvent(fileReferenceList.fileList[i] as FileReference);
				uploadEvent.dispatch();			
			}
			
		}
	}
}