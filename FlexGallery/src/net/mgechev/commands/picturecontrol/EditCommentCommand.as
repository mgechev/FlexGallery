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
	import net.mgechev.vo.PhotoCommentPairVO;
	
	public class EditCommentCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var delegate:EditCommentDelegate;
		
		public function EditCommentCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var editComment:EditCommentEvent = event as EditCommentEvent;
			delegate = new EditCommentDelegate(this, new PhotoCommentPairVO(editComment.pictureId, editComment.comment));
			modelLocator.pushService(delegate);
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