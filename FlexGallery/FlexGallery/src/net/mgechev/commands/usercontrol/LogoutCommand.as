package net.mgechev.commands.usercontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.usercontrol.LogoutDelegate;
	import net.mgechev.events.usercontrol.LogoutEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class LogoutCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LogoutCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var logoutEvent:LogoutEvent = event as LogoutEvent;
			var delegate:LogoutDelegate = new LogoutDelegate(this);
			delegate.logout();
		}
		
		public function result(event:Object):void
		{
			modelLocator.workflowState = ViewModelLocator.LOGIN_SCREEN;
			modelLocator.username = null;
			modelLocator.id = 0;
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}