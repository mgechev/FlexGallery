package net.mgechev.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class ChangePageEvent extends CairngormEvent
	{
		public static const CHANGEPAGE:String = "ChangePage";
		public var nextPage:uint;
		
		
		public function ChangePageEvent(nextPage:uint)
		{
			this.nextPage = nextPage;
			super(CHANGEPAGE);
		}
		
		override public function clone():Event
		{
			return new ChangePageEvent(nextPage);
		}
	}
}