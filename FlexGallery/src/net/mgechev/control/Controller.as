package net.mgechev.control
{	
	import com.adobe.cairngorm.control.FrontController;
	
	import mx.controls.Alert;
	
	import net.mgechev.commands.appcontrol.ChangePageCommand;
	import net.mgechev.commands.usercontrol.EditProfileCommand;
	import net.mgechev.commands.gallery.GetPictureCommentsCommand;
	import net.mgechev.commands.gallery.LoadUserListCommand;
	import net.mgechev.commands.gallery.LoadUserPicturesCommand;
	import net.mgechev.commands.usercontrol.LoginCommand;
	import net.mgechev.commands.usercontrol.LogoutCommand;
	import net.mgechev.commands.gallery.PictureCommentCommand;
	import net.mgechev.commands.usercontrol.RegistrationCommand;
	import net.mgechev.commands.picturecontrol.UploadCommand;
	import net.mgechev.events.appcontrol.ChangePageEvent;
	import net.mgechev.events.usercontrol.EditProfileEvent;
	import net.mgechev.events.gallery.GetPictureCommentsEvent;
	import net.mgechev.events.gallery.LoadUserListEvent;
	import net.mgechev.events.gallery.LoadUserPicturesEvent;
	import net.mgechev.events.usercontrol.LoginEvent;
	import net.mgechev.events.usercontrol.LogoutEvent;
	import net.mgechev.events.gallery.PictureCommentEvent;
	import net.mgechev.events.usercontrol.RegistrationEvent;
	import net.mgechev.events.picturecontrol.UploadEvent;
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
			this.addCommand(LoadUserListEvent.LOADUSERLISTEVENT, LoadUserListCommand);
			this.addCommand(LoadUserPicturesEvent.LOADUSERPICTURESEVENT, LoadUserPicturesCommand);
			this.addCommand(PictureCommentEvent.PICTURECOMMENTEVENT, PictureCommentCommand);
			this.addCommand(GetPictureCommentsEvent.GETPICTURECOMMENTS, GetPictureCommentsCommand);
		}
		
	}
}