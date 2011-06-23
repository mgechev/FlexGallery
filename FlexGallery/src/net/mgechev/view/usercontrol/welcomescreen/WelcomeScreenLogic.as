package net.mgechev.view.usercontrol.welcomescreen
{
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	
	import net.mgechev.events.usercontrol.LogoutEvent;
	
	public class WelcomeScreenLogic extends Group
	{
		[Bindable]
		public var username:String;
		public var logoutButton:Button;
		
		public function WelcomeScreenLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
		}
		
		private function init(event:Event):void
		{
			logoutButton.addEventListener(MouseEvent.CLICK, logout);
		}
		
		public function logout(event:MouseEvent):void
		{
			var logoutEvent:LogoutEvent = new LogoutEvent();
			logoutEvent.dispatch();
		}
	}
}