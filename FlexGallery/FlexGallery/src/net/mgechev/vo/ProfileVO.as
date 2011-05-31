package net.mgechev.vo
{
	public class ProfileVO
	{
		public var oldPassword:String;
		public var password:String;
		public var confirmPassword:String;
		public var email:String;
		public var username:String;
		
		public function ProfileVO(oldPassword:String, password:String, confirmPassword:String, email:String, username:String=null)
		{
			this.oldPassword = oldPassword;
			this.password = password;
			this.confirmPassword = confirmPassword;
			this.email = email;
			this.username = username;
		}
		
	}
}