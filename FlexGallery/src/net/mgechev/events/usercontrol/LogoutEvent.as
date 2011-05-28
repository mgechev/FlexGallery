package net.mgechev.events.usercontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LogoutEvent extends CairngormEvent
	{
		public static const LOGOUT:String = "Logout";
		
		public function LogoutEvent()
		{
			super(LOGOUT);
		}
	}
}
