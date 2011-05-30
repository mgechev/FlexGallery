package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.PictureCommentDelegate;
	import net.mgechev.events.gallery.PictureCommentEvent;
	import net.mgechev.model.ViewModelLocator;

	public class PictureCommentCommand implements IResponder, ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var delegate:PictureCommentDelegate;
		
		public function PictureCommentCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var pictureComment:PictureCommentEvent = event as PictureCommentEvent;
			if (pictureComment.comment.content.length >= 2)
			{
				delegate = new PictureCommentDelegate(this, pictureComment.comment);
				modelLocator.pushService(delegate);
			}
			else
			{
				Alert.show("Your comment is too short");
			}
		}
		
		public function result(event:Object):void
		{
			modelLocator.dequeue(delegate);
			modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}