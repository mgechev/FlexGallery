package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class LoadPicturesEvent extends CairngormEvent
	{
		public static const LOAD_PICTURES_EVENT:String = "LoadPicturesEvent";
		public var userId:Number;
		public var page:uint;
		
		public function LoadPicturesEvent(page:uint, userId:Number = -1)
		{
			this.userId = userId;
			this.page = page;
			super(LOAD_PICTURES_EVENT);
		}
		
		override public function clone():Event
		{
			return new LoadPicturesEvent(userId);
		}
		
	}

}