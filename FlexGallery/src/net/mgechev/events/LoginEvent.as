package net.mgechev.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.LoginVO;

	public class LoginEvent extends CairngormEvent
	{
		public static const LOGIN:String = "Login";
		public var loginData:LoginVO;
		
		public function LoginEvent(loginData:LoginVO)
		{
			this.loginData = loginData;
			super(LOGIN);
		}
		
		override public function clone():Event
		{
			return new LoginEvent(loginData);
		}
	}
}