package net.mgechev.commands.appcontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.events.appcontrol.ChangePageEvent;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.events.gallery.LoadUserListEvent;
	import net.mgechev.model.ViewModelLocator;

	public class ChangePageCommand implements ICommand
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var changePageEvent:ChangePageEvent = event as ChangePageEvent;
								
			modelLocator.currentPage = changePageEvent.nextPage;
						
			modelLocator.resetData();
			
			if (modelLocator.currentPage == ViewModelLocator.REGISTER)
			{
				modelLocator.currentState = "registration";
			}
			if (modelLocator.currentPage == ViewModelLocator.UPLOAD)
			{
				modelLocator.currentState = "uploadPictures";
			}
			if (modelLocator.currentPage == ViewModelLocator.EDIT_PROFILE)
			{
				modelLocator.currentState = "editProfile";
			}
			if (modelLocator.currentPage == ViewModelLocator.VIEW_USERS)
			{
				var loadUsersListEvent:LoadUserListEvent = new LoadUserListEvent();
				loadUsersListEvent.dispatch();
				modelLocator.currentState = "usersGallery";
			}
			if (modelLocator.currentPage == ViewModelLocator.PICTURES)
			{
				var loadPictures:LoadPicturesEvent = new LoadPicturesEvent(0, modelLocator.id);
				loadPictures.dispatch();
				modelLocator.currentState = "picturesControl";
			}
			if (modelLocator.currentPage == ViewModelLocator.HOME)
			{
				var loadHomePage:LoadPicturesEvent = new LoadPicturesEvent(0, -1);
				loadHomePage.dispatch();
				modelLocator.currentState = "gallery";
			}
		}
	}
}