package net.mgechev.events.usercontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.ProfileVO;
	
	public class RegistrationEvent extends CairngormEvent
	{
		public static const REGISTER:String = "Register";
		public var registerData:ProfileVO;
		
		public function RegistrationEvent(registerData:ProfileVO)
		{
			this.registerData = registerData;
			super(REGISTER);
		}
		
		override public function clone():Event
		{
			return new RegistrationEvent(registerData);
		}
	}
}