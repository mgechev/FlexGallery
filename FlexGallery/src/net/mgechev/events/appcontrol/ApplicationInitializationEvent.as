package net.mgechev.events.appcontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ApplicationInitializationEvent extends CairngormEvent
	{
		public static const APPLICATION_INITIALIZATION:String = "ApplicationInitialization";	
		
		public function ApplicationInitializationEvent()
		{
			super(APPLICATION_INITIALIZATION);
		}

	}
}