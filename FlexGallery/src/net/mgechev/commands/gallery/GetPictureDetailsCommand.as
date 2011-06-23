package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.gallery.GetPictureDetailsDelegate;
	import net.mgechev.events.gallery.GetPictureDetailsEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.CommentVO;

	public class GetPictureDetailsCommand implements IResponder, ICommand
	{		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var delegate:GetPictureDetailsDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
				
		public function execute(event:CairngormEvent):void
		{
			var getPictureComments:GetPictureDetailsEvent = event as GetPictureDetailsEvent;
			delegate = new GetPictureDetailsDelegate(this, getPictureComments.pictureId);
			
			delegatesQueue.registerDelegate(delegate);
		}
		
		public function result(event:Object):void
		{
			modelLocator.pictureComments = new ArrayCollection();
			modelLocator.pictureRating = Math.round(event.result.rating * 100)/100;
			modelLocator.pictureRatingCount = event.result.count;
			modelLocator.pictureRatingSum = event.result.ratingSum;
			
			if (event.result.comment != 0)
			{
				if (event.result.comment.length > 1)
				{
					for (var i:Number = 0; i < event.result.comment.length; i++) {
						
						var comment:CommentVO = 
							new CommentVO(event.result.comment[i].content,
											event.result.comment[i].username,
											event.result.comment[i].date);
						modelLocator.pictureComments.addItem(comment);
						
					}
				}
				else
				{
					var singleComment:CommentVO =
						new CommentVO(event.result.comment.content,
							event.result.comment.username,
							event.result.comment.date);

					modelLocator.pictureComments.addItem(singleComment);
				}
			}
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}