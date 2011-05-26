package service.impl
{
	import mx.rpc.AsyncToken;
	import mx.rpc.http.mxml.HTTPService;
	
	import temp.service.*;

	public class LoginService implements ILoginService
	{
		public var loginService:HTTPService;
		public function login(username:String, password:String, responder:IResponder):AsyncToken
		{
			loginService.request = new XML("<username>" + username + "</username>" +
				"<password>" + password + "</password>");
			loginService.send();
		}
	}
}