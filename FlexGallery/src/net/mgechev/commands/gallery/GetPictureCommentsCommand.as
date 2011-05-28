package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.GetPictureCommentsDelegate;
	import net.mgechev.events.gallery.GetPictureCommentsEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.CommentVO;

	public class GetPictureCommentsCommand implements IResponder, ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function GetPictureCommentsCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var getPictureComments:GetPictureCommentsEvent = event as GetPictureCommentsEvent;
			var delegate:GetPictureCommentsDelegate = new GetPictureCommentsDelegate(this);
			delegate.getComments(getPictureComments.pictureId);
		}
		
		public function result(event:Object):void
		{
			modelLocator.pictureComments = new ArrayCollection();
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
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}