package net.mgechev.control
{	
	import com.adobe.cairngorm.control.FrontController;
	
	import mx.controls.Alert;
	
	import net.mgechev.commands.appcontrol.ApplicationInitializationCommand;
	import net.mgechev.commands.appcontrol.ChangePageCommand;
	import net.mgechev.commands.appcontrol.LoginCheckCommand;
	import net.mgechev.commands.gallery.CommentFieldControlCommand;
	import net.mgechev.commands.gallery.GetPictureDetailsCommand;
	import net.mgechev.commands.gallery.LoadPicturesCommand;
	import net.mgechev.commands.gallery.LoadUserListCommand;
	import net.mgechev.commands.gallery.PictureCommentCommand;
	import net.mgechev.commands.gallery.PictureVoteCommand;
	import net.mgechev.commands.gallery.StartSlideShowCommand;
	import net.mgechev.commands.gallery.StopSlideShowCommand;
	import net.mgechev.commands.picturecontrol.DeletePictureCommand;
	import net.mgechev.commands.picturecontrol.EditCommentCommand;
	import net.mgechev.commands.picturecontrol.UploadCommand;
	import net.mgechev.commands.usercontrol.EditProfileCommand;
	import net.mgechev.commands.usercontrol.LoginCommand;
	import net.mgechev.commands.usercontrol.LogoutCommand;
	import net.mgechev.commands.usercontrol.RegistrationCommand;
	import net.mgechev.events.appcontrol.ApplicationInitializationEvent;
	import net.mgechev.events.appcontrol.ChangePageEvent;
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.events.gallery.CommentFieldControlEvent;
	import net.mgechev.events.gallery.GetPictureDetailsEvent;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.events.gallery.LoadUserListEvent;
	import net.mgechev.events.gallery.PictureCommentEvent;
	import net.mgechev.events.gallery.PictureVoteEvent;
	import net.mgechev.events.gallery.StartSlideShowEvent;
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.events.picturecontrol.DeletePictureEvent;
	import net.mgechev.events.picturecontrol.EditCommentEvent;
	import net.mgechev.events.picturecontrol.UploadEvent;
	import net.mgechev.events.usercontrol.EditProfileEvent;
	import net.mgechev.events.usercontrol.LoginEvent;
	import net.mgechev.events.usercontrol.LogoutEvent;
	import net.mgechev.events.usercontrol.RegistrationEvent;
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
			this.addCommand(LoadPicturesEvent.LOAD_PICTURES_EVENT, LoadPicturesCommand);
			this.addCommand(PictureCommentEvent.PICTURECOMMENTEVENT, PictureCommentCommand);
			this.addCommand(GetPictureDetailsEvent.GETPICTURECOMMENTS, GetPictureDetailsCommand);
			this.addCommand(PictureVoteEvent.PICTURE_VOTE_EVENT, PictureVoteCommand);
			this.addCommand(DeletePictureEvent.DELETE_PICTURE, DeletePictureCommand);
			this.addCommand(EditCommentEvent.EDIT_COMMENT_EVENT, EditCommentCommand);
			this.addCommand(LoginCheckEvent.LOGIN_CHECK, LoginCheckCommand);
			this.addCommand(ApplicationInitializationEvent.APPLICATION_INITIALIZATION, ApplicationInitializationCommand);
			this.addCommand(CommentFieldControlEvent.COMMENT_FIELD_ENABLE_EVENT, CommentFieldControlCommand);
			this.addCommand(StartSlideShowEvent.START_SLIDE_SHOW_EVENT, StartSlideShowCommand);
			this.addCommand(StopSlideShowEvent.STOP_SLIDE_SHOW_EVENT, StopSlideShowCommand);
		}
		
	}
}