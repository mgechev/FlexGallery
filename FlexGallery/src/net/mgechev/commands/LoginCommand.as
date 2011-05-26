package net.mgechev.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.LoginDelegate;
	import net.mgechev.events.LoginEvent;
	import net.mgechev.model.ViewModelLocator;

	public class LoginCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LoginCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var loginEvent:LoginEvent = event as LoginEvent;
			var delegate:LoginDelegate = new LoginDelegate(this);
			delegate.login(loginEvent.loginData);
		}
		
		public function result(event:Object):void
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
			}
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}