package net.mgechev.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class LogoutEvent extends CairngormEvent
	{
		public static const LOGOUT:String = "Logout";
		
		public function LogoutEvent()
		{
			super(LOGOUT);
		}
	}
}
