package net.mgechev.events.appcontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoginCheckEvent extends CairngormEvent
	{
		public static const LOGIN_CHECK:String = "LoginCheck";
		
		public function LoginCheckEvent()
		{
			super(LOGIN_CHECK);
		}
	}
}