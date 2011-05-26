package net.mgechev.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.EditProfileVO;
	
	public class EditProfileEvent extends CairngormEvent
	{
		public static const EDITPROFILE:String = "EditProfile";
		public var editProfileData:EditProfileVO;
		
		public function EditProfileEvent(editProfileData:EditProfileVO)
		{
			this.editProfileData = editProfileData;
			super(EDITPROFILE);
		}
		
		override public function clone():Event
		{
			return new EditProfileEvent(editProfileData);
		}
	}
}