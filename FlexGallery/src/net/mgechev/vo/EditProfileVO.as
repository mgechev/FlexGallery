package net.mgechev.vo
{
	public class EditProfileVO
	{
		public var oldPassword:String;
		public var password:String;
		public var confirmPassword:String;
		public var email:String;
		
		public function EditProfileVO(oldPassword:String, password:String, confirmPassword:String, email:String)
		{
			this.oldPassword = oldPassword;
			this.password = password;
			this.confirmPassword = confirmPassword;
			this.email = email;
		}
	}
}