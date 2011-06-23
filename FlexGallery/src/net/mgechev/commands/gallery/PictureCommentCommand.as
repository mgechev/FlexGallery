package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.gallery.PictureCommentDelegate;
	import net.mgechev.events.gallery.PictureCommentEvent;
	import net.mgechev.model.ViewModelLocator;

	public class PictureCommentCommand implements IResponder, ICommand
	{
		private var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var delegate:PictureCommentDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			var pictureComment:PictureCommentEvent = event as PictureCommentEvent;
			if (pictureComment.comment.content.length >= 2)
			{
				delegate = new PictureCommentDelegate(this, pictureComment.comment);
				
				delegatesQueue.registerDelegate(delegate);
			}
			else
			{
				Alert.show("Your comment is too short");
			}
		}
		
		public function result(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}