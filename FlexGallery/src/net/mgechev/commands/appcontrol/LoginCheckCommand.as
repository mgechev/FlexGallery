package net.mgechev.commands.appcontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.appcontrol.LoginCheckDelegate;
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.model.ViewModelLocator;

	public class LoginCheckCommand implements ICommand, IResponder
	{
		public var delegate:LoginCheckDelegate;
		
		private var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			var loginCheck:LoginCheckEvent = event as LoginCheckEvent;
			delegate = new LoginCheckDelegate(this);
			
			//delegatesQueue.registerDelegate(delegate);
		}
		
		public function result(event:Object):void
		{
			if (event.result.login == false && 
				modelLocator.workflowState == ViewModelLocator.WELCOME_SCREEN)
			{
				modelLocator.workflowState = ViewModelLocator.LOGIN_SCREEN;
				modelLocator.logout();
			}
			if (event.result.login == true &&
				modelLocator.workflowState == ViewModelLocator.LOGIN_SCREEN)
			{
				modelLocator.workflowState = ViewModelLocator.WELCOME_SCREEN;
				modelLocator.username = event.result.username;
				modelLocator.id = event.result.id;
				modelLocator.email = event.result.email;
			}
			
			delegatesQueue.unregisterDelegate(delegate);
			//modelLocator.dequeue(delegate);
			//modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}