package service.impl
{
	import mx.rpc.AsyncToken;
	import mx.rpc.http.mxml.HTTPService;

	public class RegisterService 
	{
		public var service:HTTPService;
		public function registerUser(username:String, password:String, email:String):AsyncToken
		{
			service.request = new XML("<username>" + username + "</username>" +
				"<password>" + password + "</password>" +
				"<email>" + email + "</email>");
			return service.send();
		}
	}
}