package temp.service
{
	interface ILoginService
	{
		function login(username:String, password:String, responder:IResponder):AsyncToken;
	}
}