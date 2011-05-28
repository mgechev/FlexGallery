package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class GetPictureCommentsEvent extends CairngormEvent
	{
		public static const GETPICTURECOMMENTS:String = "GetPictureComments";
		
		public var pictureId:uint;
		
		public function GetPictureCommentsEvent(pictureId:uint)
		{
			this.pictureId = pictureId;
			super(GETPICTURECOMMENTS);
		}
		
		override public function clone():Event
		{
			return new GetPictureCommentsEvent(pictureId);
		}
	}
}