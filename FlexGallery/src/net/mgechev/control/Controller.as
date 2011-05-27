package net.mgechev.control
{	
	import com.adobe.cairngorm.control.FrontController;
	
	import mx.controls.Alert;
	
	import net.mgechev.commands.ChangePageCommand;
	import net.mgechev.commands.EditProfileCommand;
	import net.mgechev.commands.LoginCommand;
	import net.mgechev.commands.LogoutCommand;
	import net.mgechev.commands.RegistrationCommand;
	import net.mgechev.commands.UploadCommand;
	import net.mgechev.events.ChangePageEvent;
	import net.mgechev.events.EditProfileEvent;
	import net.mgechev.events.LoginEvent;
	import net.mgechev.events.LogoutEvent;
	import net.mgechev.events.RegistrationEvent;
	import net.mgechev.events.UploadEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class Controller extends FrontController 
	{
		public function Controller()
		{
			this.initialize();
		}
		
		public function initialize():void
		{
			this.addCommand(LoginEvent.LOGIN, LoginCommand);
			this.addCommand(LogoutEvent.LOGOUT, LogoutCommand);
			this.addCommand(ChangePageEvent.CHANGEPAGE, ChangePageCommand);
			this.addCommand(EditProfileEvent.EDITPROFILE, EditProfileCommand);
			this.addCommand(RegistrationEvent.REGISTER, RegistrationCommand);
			this.addCommand(UploadEvent.UPLOAD, UploadCommand);
		}
		
	}
}