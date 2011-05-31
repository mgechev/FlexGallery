package net.mgechev.events.usercontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.UserVO;

	public class LoginEvent extends CairngormEvent
	{
		public static const LOGIN:String = "Login";
		public var loginData:UserVO;
		
		public function LoginEvent(loginData:UserVO)
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