package net.mgechev.view.usercontrol.editprofile
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import net.mgechev.events.usercontrol.EditProfileEvent;
	import net.mgechev.vo.ProfileVO;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;

	public class EditProfileFormLogic extends Group
	{		
		[Bindable]
		public var email:String;
		public var registerButton:Button;
		public var oldPasswordInput:TextInput;
		public var passwordInput:TextInput;
		public var confirmPasswordInput:TextInput;
		public var emailInput:TextInput;
		
		public function EditProfileFormLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			registerButton.addEventListener(MouseEvent.CLICK, editProfile);
		}
		
		public function editProfile(event:MouseEvent):void
		{			
			var editProfileEvent:EditProfileEvent = new EditProfileEvent(
				new ProfileVO(oldPasswordInput.text, passwordInput.text, 
					confirmPasswordInput.text, emailInput.text));
			editProfileEvent.dispatch();
			
		}
		
	}
}