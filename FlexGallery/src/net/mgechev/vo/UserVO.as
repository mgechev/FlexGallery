package net.mgechev.vo
{		
		public class UserVO {
			
			public var username:String;
			public var id:uint;
			public var password:String;
			
			public function UserVO(username:String,password:String,id:uint = 0) 
			{
				
				this.username = username;
				this.password = password;
				this.id = id;
				
			}
			
		}
	}