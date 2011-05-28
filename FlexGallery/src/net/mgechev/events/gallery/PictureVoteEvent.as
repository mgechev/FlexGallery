package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class PictureVoteEvent extends CairngormEvent
	{
		public static const PICTURE_VOTE_EVENT:String = "PictureVoteEvent";
		public var pictureId:uint;
		public var rating:uint;
		
		public function PictureVoteEvent(pictureId:uint, rating:uint):void
		{
			this.pictureId = pictureId;
			this.rating = rating;
			super(PICTURE_VOTE_EVENT);
		}
		
		override public function clone():Event
		{
			return new PictureVoteEvent(pictureId, rating);
		}
	}
}