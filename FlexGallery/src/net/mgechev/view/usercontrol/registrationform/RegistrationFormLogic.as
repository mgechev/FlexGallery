package net.mgechev.view.usercontrol.registrationform
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import net.mgechev.events.usercontrol.RegistrationEvent;
	import net.mgechev.vo.ProfileVO;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;


	public class RegistrationFormLogic extends Group
	{
		public var registerButton:Button;
		public var usernameInput:TextInput;
		public var passwordInput:TextInput;
		public var confirmPasswordInput:TextInput;
		public var emailInput:TextInput;
		
		public function RegistrationFormLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
	
		private function init(event:Event):void
		{
			registerButton.addEventListener(MouseEvent.CLICK, register);
		}
		
		public function register(event:MouseEvent):void
		{
			var registerEvent:RegistrationEvent = new RegistrationEvent(
				new ProfileVO(null, passwordInput.text, confirmPasswordInput.text,
					emailInput.text, usernameInput.text));
			registerEvent.dispatch();
		}
	}
}