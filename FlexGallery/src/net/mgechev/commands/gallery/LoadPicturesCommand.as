package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.gallery.LoadPicturesDelegate;
	import net.mgechev.business.gallery.LoadUserListDelegate;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.CommentVO;
	import net.mgechev.vo.PageUserPairVO;
	import net.mgechev.vo.PhotoVO;

	public class LoadPicturesCommand implements ICommand, IResponder
	{		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var delegate:LoadPicturesDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			var loadPictures:LoadPicturesEvent = event as LoadPicturesEvent;
			delegate = new LoadPicturesDelegate(this, new PageUserPairVO(loadPictures.page, loadPictures.userId));
			
			delegatesQueue.registerDelegate(delegate);
		}
		
		private function getPictureComments(comments:Object):ArrayCollection
		{
			var pictureComments:ArrayCollection = new ArrayCollection();
			if (comments != 0 && comments.length > 1)
			{
				for (var j:uint = 0; j < comments.length; j++)
				{
					var comment:CommentVO = new CommentVO(
						comments[j].content,
						comments[j].username,
						comments[j].date,
						comments[j].id);
					pictureComments.addItem(comment);
				}
			}
			return pictureComments;
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
					photo.comment = event.result.picture[i].description;
					photo.votesCount = event.result.picture[i].count;
					photo.rating = event.result.picture[i].rating;
					photo.ratingSum = event.result.picture[i].ratingSum;
					photo.commentsList = getPictureComments(event.result.picture[i].comment);
					modelLocator.picturesList.addItem(photo);	
				}
			}
			if (modelLocator.picturesList.length > 0)
			{
				modelLocator.selectedPicture = modelLocator.picturesList[0];
			}
			
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
		
	}
	
}