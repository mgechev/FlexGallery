package net.mgechev.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	[Bindable]
	public class ViewModelLocator implements IModelLocator {
		
		private static var instance:ViewModelLocator;
		
		public function ViewModelLocator(enforcer:SingletonEnforcer) {
			if (enforcer == null) {
				throw new Error("You Can Only Have One ViewModelLocator");
			}
		}
		
		public static function getInstance() : ViewModelLocator {
			if (instance == null) {
				instance = new ViewModelLocator(new SingletonEnforcer);
			}
			return instance;
		}
		
		public var currentPage:uint = 0;
		public var workflowState:uint = 0;
		public var username:String;
		public var id:uint;
		public var email:String;
		
		public static const LOGIN_SCREEN:uint = 0;
		public static const WELCOME_SCREEN:uint = 1;
		
		public static const HOME:uint = 0;
		public static const UPLOAD:uint = 1;
		public static const REGISTER:uint = 2;
		public static const PICTURES:uint = 3;
		public static const EDIT_PROFILE:uint = 4;
		public static const VIEW_USERS:uint = 5;
		
	}
}
		
	// Utility Class to Deny Access to Constructor
	class SingletonEnforcer {}