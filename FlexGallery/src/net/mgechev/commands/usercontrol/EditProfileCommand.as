package net.mgechev.commands.usercontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.usercontrol.EditProfileDelegate;
	import net.mgechev.events.usercontrol.EditProfileEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.ProfileVO;

	public class EditProfileCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var editProfileData:ProfileVO;
		private var delegate:EditProfileDelegate;
		
		public function EditProfileCommand()
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
			var editProfileEvent:EditProfileEvent = event as EditProfileEvent;
			if (isValidData(editProfileEvent.editProfileData))
			{
				delegate = new EditProfileDelegate(this, editProfileEvent.editProfileData);
				editProfileData = editProfileEvent.editProfileData;
				modelLocator.pushService(delegate);
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
				modelLocator.email = editProfileData.email;
			}
			modelLocator.dequeue(delegate);
			modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}