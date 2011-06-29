package net.mgechev.commands.usercontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.usercontrol.LoginDelegate;
	import net.mgechev.events.usercontrol.LoginEvent;
	import net.mgechev.model.ViewModelLocator;

	public class LoginCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var delegate:LoginDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			var loginEvent:LoginEvent = event as LoginEvent;			
						
			if (loginEvent.loginData.username == "" ||
				loginEvent.loginData.password == "")
				return;
			
			delegate = new LoginDelegate(this, loginEvent.loginData);			
			delegatesQueue.registerDelegate(delegate);
		}
		
		public function result(event:Object):void
		{
			if (event.result)
			{
				if (event.result.error)
				{
					Alert.show("Wrong username or password");
				}
				else			
				{
					modelLocator.id = event.result.success.id;
					modelLocator.username = event.result.success.username;
					modelLocator.email = event.result.success.email;
					modelLocator.workflowState = ViewModelLocator.WELCOME_SCREEN;
					modelLocator.currentState = "gallery";
				}
			}
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}