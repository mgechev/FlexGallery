package net.mgechev.view.picturecontrol.editpictures
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.view.renderers.EditPicturesRenderer;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.List;

	public class EditPicturesLogic extends Group
	{		
		[Bindable]
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public var backButton:Button;
		public var nextButton:Button;
		public var picturesList:List;
		
		public function EditPicturesLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			backButton.addEventListener(MouseEvent.CLICK, previousPage);
			nextButton.addEventListener(MouseEvent.CLICK, nextPage);
		}
		
		protected function loadUserPictures(event:Event):void
		{
			modelLocator.pageReached = 0;
			loadPictures(0);
		}
		
		protected function loadPictures(page:uint):void
		{
			var loadPictures:LoadPicturesEvent = new LoadPicturesEvent(page, modelLocator.id);
			loadPictures.dispatch();
		}
		
		protected function nextPage(event:Event):void
		{
			if (modelLocator.picturesList.length > ViewModelLocator.PICTURES_PER_PAGE - 1)
			{
				modelLocator.pageReached++;
				loadPictures(modelLocator.pageReached);
			}
		}
		
		protected function previousPage(event:Event):void
		{
			if (modelLocator.pageReached > 0)
			{
				modelLocator.pageReached--;
				loadPictures(modelLocator.pageReached);
			}
		}	
	}
}