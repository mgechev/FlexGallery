package net.mgechev.events.usercontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.ProfileVO;
	
	public class EditProfileEvent extends CairngormEvent
	{
		public static const EDITPROFILE:String = "EditProfile";
		public var editProfileData:ProfileVO;
		
		public function EditProfileEvent(editProfileData:ProfileVO)
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