package net.mgechev.commands.usercontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.usercontrol.LogoutDelegate;
	import net.mgechev.events.usercontrol.LogoutEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class LogoutCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var delegate:LogoutDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;

		public function execute(event:CairngormEvent):void
		{
			var logoutEvent:LogoutEvent = event as LogoutEvent;
			delegate = new LogoutDelegate(this);
			
			delegatesQueue.registerDelegate(delegate);
		}
		
		public function result(event:Object):void
		{
			modelLocator.workflowState = ViewModelLocator.LOGIN_SCREEN;
			modelLocator.username = null;
			modelLocator.id = 0;
			
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}