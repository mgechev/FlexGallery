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
		
		public function PictureCommentCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var pictureComment:PictureCommentEvent = event as PictureCommentEvent;
			if (pictureComment.comment.content.length >= 2)
			{
				var delegate:PictureCommentDelegate = new PictureCommentDelegate(this);
				delegate.comment(pictureComment.comment);
			}
			else
			{
				Alert.show("Your comment is too short");
			}
		}
		
		public function result(event:Object):void
		{

		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}