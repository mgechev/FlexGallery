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
		
		private function loadCommentList(comments:Object):ArrayCollection
		{
			var pictureComments:ArrayCollection = new ArrayCollection();
			for (var j:uint = 0; j < comments.length; j++)
			{
				var comment:CommentVO = new CommentVO(
					comments[j].content,
					comments[j].username,
					comments[j].date,
					comments[j].id);
				pictureComments.addItem(comment);
			}
			return pictureComments;
		}
		
		private function loadSingleComment(comments:Object):ArrayCollection
		{
			var pictureComments:ArrayCollection = new ArrayCollection();
			var singleComment:CommentVO = new CommentVO(
				comments.content,
				comments.username,
				comments.date,
				comments.id);
			pictureComments.addItem(singleComment);
			return pictureComments;
		}
		
		private function getPictureComments(comments:Object):ArrayCollection
		{
			var pictureComments:ArrayCollection = new ArrayCollection();
			if (comments != 0)
			{
				if (comments.length > 1)
				{
					return loadCommentList(comments);
				}
				else
				{
					return loadSingleComment(comments);						
				}
			}
			return pictureComments;
		}
		
		private function loadPictureList(pictureList:Object):void
		{
			for (var i:uint = 0; i < pictureList.length; i++)
			{					
				var photo:PhotoVO = new PhotoVO();
				photo.id = pictureList[i].id;
				photo.name = pictureList[i].title;
				photo.comment = pictureList[i].description;
				photo.votesCount = pictureList[i].count;
				photo.rating = pictureList[i].rating;
				photo.ratingSum = pictureList[i].ratingSum;
				photo.commentsList = getPictureComments(pictureList[i].comment);
				
				modelLocator.picturesList.addItem(photo);
			}
		}
		
		private function loadSinglePicture(picture:Object):void
		{
			var photo:PhotoVO = new PhotoVO();
			photo.id = picture.id;
			photo.name = picture.title;
			photo.comment = picture.description;
			photo.votesCount = picture.count;
			photo.rating = picture.rating;
			photo.ratingSum = picture.ratingSum;
			photo.commentsList = getPictureComments(picture.comment);
			
			modelLocator.picturesList.addItem(photo);
		}
		
		public function result(event:Object):void
		{
			modelLocator.picturesList = new ArrayCollection();
			modelLocator.picturesCount = event.result.picturesCount;
			
			if (event.result.picture != 0)
			{
				if (event.result.picture.length > 1)
				{
					loadPictureList(event.result.picture);
				}
				else
				{
					loadSinglePicture(event.result.picture);
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