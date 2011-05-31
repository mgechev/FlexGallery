package net.mgechev.commands.usercontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.usercontrol.EditProfileDelegate;
	import net.mgechev.business.usercontrol.RegistrationDelegate;
	import net.mgechev.events.usercontrol.EditProfileEvent;
	import net.mgechev.events.usercontrol.RegistrationEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.ProfileVO;
	
	public class RegistrationCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function RegistrationCommand()
		{
		}
		
		public function isValidData(data:ProfileVO):Boolean
		{

			if (data.password != data.confirmPassword)
			{
				Alert.show("Passwords doesn't match!");
				return false;
			}
			if (!data.email.match("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$"))
			{
				Alert.show("Invalid email!");
				return false;
			}
			return true;
		}
		
		public function execute(event:CairngormEvent):void
		{
			var registerEvent:RegistrationEvent = event as RegistrationEvent;
			if (isValidData(registerEvent.registerData))
			{
				var delegate:RegistrationDelegate = new RegistrationDelegate(this);
				delegate.register(registerEvent.registerData);
			}
		}
		
		public function result(event:Object):void
		{
			if (event.result.error)
			{
				Alert.show(event.result.error);
			}
			else			
			{
				Alert.show(event.result.success);
			}
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}