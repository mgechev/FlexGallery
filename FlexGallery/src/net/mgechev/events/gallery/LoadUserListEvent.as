package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.events.Event;
	
	public class LoadUserListEvent extends CairngormEvent
	{
		public static const LOADUSERLISTEVENT:String = "LoadUserListEvent";
		
		public function LoadUserListEvent()
		{
			super(LOADUSERLISTEVENT);
		}
	}
}