package net.mgechev.commands.picturecontrol
{	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.picturecontrol.EditCommentDelegate;
	import net.mgechev.events.picturecontrol.EditCommentEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class EditCommentCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function EditCommentCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var editComment:EditCommentEvent = event as EditCommentEvent;
			var delegate:EditCommentDelegate = new EditCommentDelegate(this);
			delegate.editComment(editComment.pictureId, editComment.comment);
		}
		
		public function result(event:Object):void
		{
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
	
}