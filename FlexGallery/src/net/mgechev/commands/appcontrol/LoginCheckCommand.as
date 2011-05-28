package net.mgechev.commands.appcontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.appcontrol.LoginCheckDelegate;
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.model.ViewModelLocator;

	public class LoginCheckCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LoginCheckCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var loginCheck:LoginCheckEvent = event as LoginCheckEvent;
			var delegate:LoginCheckDelegate = new LoginCheckDelegate(this);
			delegate.check();
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
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}