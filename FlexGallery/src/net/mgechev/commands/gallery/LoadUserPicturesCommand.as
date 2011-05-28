package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.LoadUserListDelegate;
	import net.mgechev.business.gallery.LoadUserPicturesDelegate;
	import net.mgechev.events.gallery.LoadUserPicturesEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.PhotoVO;

	public class LoadUserPicturesCommand implements ICommand, IResponder
	{
		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LoadUserPicturesCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var loadUserPictures:LoadUserPicturesEvent = event as LoadUserPicturesEvent;
			var delegate:LoadUserPicturesDelegate = new LoadUserPicturesDelegate(this);
			delegate.load(loadUserPictures.userId);
		}
		
		public function result(event:Object):void
		{
			modelLocator.picturesList = new ArrayCollection();
			if (event.result.picture.length > 0)
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
			else					
			{
				var singlePhoto:PhotoVO = new PhotoVO();
				singlePhoto.id = event.result.picture.id;
				singlePhoto.name = event.result.picture.title;
				singlePhoto.comment = event.result.picture.comment;
				modelLocator.picturesList.addItem(singlePhoto);
			}
		}
		
		public function fault(event:Object):void
		{
			
		}
		
	}
	
}