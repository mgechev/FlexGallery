package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.LoadPicturesDelegate;
	import net.mgechev.business.gallery.LoadUserListDelegate;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.PhotoVO;

	public class LoadPicturesCommand implements ICommand, IResponder
	{
		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LoadPicturesCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var loadPictures:LoadPicturesEvent = event as LoadPicturesEvent;
			var delegate:LoadPicturesDelegate = new LoadPicturesDelegate(this);
			delegate.load(loadPictures.page, loadPictures.userId);
		}
		
		public function result(event:Object):void
		{
			modelLocator.picturesList = new ArrayCollection();
			if (event.result.picture != 0)
			{
				for (var i:uint = 0; i < event.result.picture.length; i++)
				{					
					var photo:PhotoVO = new PhotoVO();
					photo.id = event.result.picture[i].id;
					photo.name = event.result.picture[i].title;
					photo.comment = event.result.picture[i].comment;
					modelLocator.picturesList.addItem(photo);
				}
			}
			modelLocator.selectedPicture = modelLocator.picturesList[0];
		}
		
		public function fault(event:Object):void
		{
			
		}
		
	}
	
}