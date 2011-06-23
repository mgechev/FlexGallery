package net.mgechev.commands.appcontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	
	import net.mgechev.events.appcontrol.LoginCheckEvent;
	import net.mgechev.model.ViewModelLocator;

	public class ApplicationInitializationCommand implements ICommand
	{		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			loginCheck();
			var loginCheckTimer:Timer = new Timer(5000, 0);
			loginCheckTimer.addEventListener(TimerEvent.TIMER, loginCheck);
			loginCheckTimer.start();	
		}
		
		private function loginCheck(event:Event = null):void
		{
			var loginCheck:LoginCheckEvent = new LoginCheckEvent();
			loginCheck.dispatch();
		}
	}
}