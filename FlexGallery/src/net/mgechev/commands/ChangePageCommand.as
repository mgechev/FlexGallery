package net.mgechev.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.events.ChangePageEvent;
	import net.mgechev.model.ViewModelLocator;

	public class ChangePageCommand implements ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function ChangePageCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var changePageEvent:ChangePageEvent = event as ChangePageEvent;
			modelLocator.currentPage = changePageEvent.nextPage;
		}
	}
}