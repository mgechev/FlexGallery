package net.mgechev.view.usercontrol.loginform
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import net.mgechev.events.usercontrol.LoginEvent;
	import net.mgechev.vo.UserVO;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;

	public class LoginFormLogic extends Group
	{
		public var loginButton:Button;
		public var usernameInput:TextInput;
		public var passwordInput:TextInput;
		
		public function LoginFormLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		public function init(event:Event):void
		{
			loginButton.addEventListener(MouseEvent.CLICK, login);			
		}
		
		public function login(event:MouseEvent):void
		{
			var loginEvent:LoginEvent = new LoginEvent(new UserVO(usernameInput.text, passwordInput.text));
			loginEvent.dispatch();
		}
	}
}