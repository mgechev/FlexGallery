package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class LoadUserPicturesEvent extends CairngormEvent
	{
		public static const LOADUSERPICTURESEVENT:String = "LoadUserPicturesEvent";
		public var userId:uint;
		
		public function LoadUserPicturesEvent(userId:uint)
		{
			this.userId = userId;
			super(LOADUSERPICTURESEVENT);
		}
		
		override public function clone():Event
		{
			return new LoadUserPicturesEvent(userId);
		}
		
	}

}