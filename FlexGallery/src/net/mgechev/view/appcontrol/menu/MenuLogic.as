package net.mgechev.view.appcontrol.menu
{
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import net.mgechev.events.appcontrol.ChangePageEvent;
	import net.mgechev.model.ViewModelLocator;
	
	import spark.components.Button;
	import spark.components.Group;

	public class MenuLogic extends Group
	{
		public var uploadButton:Button;
		public var registerButton:Button;
		public var picturesButton:Button;
		public var editProfileButton:Button;
		public var usersButton:Button;
		public var homeButton:Button;
		
		[Bindable]
		public var logged:Boolean = false;
				
		public function MenuLogic()
		{			
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		private function init(event:FlexEvent):void
		{
			uploadButton.addEventListener(MouseEvent.CLICK, changePage);
			registerButton.addEventListener(MouseEvent.CLICK, changePage);
			picturesButton.addEventListener(MouseEvent.CLICK, changePage);
			editProfileButton.addEventListener(MouseEvent.CLICK, changePage);
			usersButton.addEventListener(MouseEvent.CLICK, changePage);
			homeButton.addEventListener(MouseEvent.CLICK, changePage);
		}
		
		public function changePage(event:MouseEvent):void
		{
			var nextPage:uint;
			switch (event.target)
			{
				case uploadButton : nextPage = ViewModelLocator.UPLOAD;
					break;
				case registerButton : nextPage = ViewModelLocator.REGISTER;
					break;
				case picturesButton : nextPage = ViewModelLocator.PICTURES;
					break;
				case editProfileButton : nextPage = ViewModelLocator.EDIT_PROFILE;
					break;
				case usersButton : nextPage = ViewModelLocator.VIEW_USERS;
					break;
				case homeButton : nextPage = ViewModelLocator.HOME;
					break;
				default : nextPage = ViewModelLocator.HOME;
					break;
			}
			var changePageEvent:ChangePageEvent = new ChangePageEvent(nextPage);
			changePageEvent.dispatch();
		}
	}
}