package net.mgechev.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import net.mgechev.vo.PhotoVO;
	
	[Bindable]
	public class ViewModelLocator implements IModelLocator {
		
		private static var instance:ViewModelLocator;
		
		public function ViewModelLocator(enforcer:SingletonEnforcer) {
			if (enforcer == null) {
				throw new Error("You can have only one instance of ViewModelLocator!");
			}
		}
		
		public static function getInstance() : ViewModelLocator {
			if (instance == null) {
				instance = new ViewModelLocator(new SingletonEnforcer);
			}
			return instance;
		}
		
		public var usersList:ArrayCollection;
		
		public var selectedPicture:PhotoVO;
		public var picturesList:ArrayCollection;
		public var pictureComments:ArrayCollection;
		public var picturesVoted:ArrayCollection = new ArrayCollection();
		public var pictureRating:Number = 0;
		public var pictureRatingCount:uint;
		public var pictureRatingSum:uint;
		public var pageReached:uint = 0;
		
		public var currentPage:uint = 0;
		public var workflowState:uint = 0;
		public var username:String;
		public var id:uint;
		public var email:String;
		
		public var filesUploaded:Dictionary;
		public var uploadProgress:uint = 0;
		
		public static const LOGIN_SCREEN:uint = 0;
		public static const WELCOME_SCREEN:uint = 1;
		
		public static const HOME:uint = 0;
		public static const UPLOAD:uint = 1;
		public static const REGISTER:uint = 2;
		public static const PICTURES:uint = 3;
		public static const EDIT_PROFILE:uint = 4;
		public static const VIEW_USERS:uint = 5;
		public static const SLIDESHOW_TIMEOUT:uint = 5000;
		
		public static const PICTURES_PER_PAGE:uint = 8;
		
		public function logout():void
		{
			workflowState = 0;
			username = null;
			id = 0;
			email = null;
			currentPage = ViewModelLocator.HOME;
		}
		
		public function resetData():void
		{
			usersList = null;
			
			selectedPicture = null;
			picturesList = null;
			pictureComments = null;
			picturesVoted = new ArrayCollection();
			pictureRating = 0;
			pictureRatingCount = 0;
			pictureRatingSum = 0;
			pageReached = 0;
			
			filesUploaded = null;
			uploadProgress = 0;		
			
		}
		
	}
}
		
	// Utility Class to Deny Access to Constructor
	class SingletonEnforcer {}