package net.mgechev.events.picturecontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class EditCommentEvent extends CairngormEvent
	{
		public static const EDIT_COMMENT_EVENT:String = "EditCommentEvent";
		public var pictureId:uint;
		public var comment:String;
		
		public function EditCommentEvent(pictureId:uint, comment:String)
		{
			this.pictureId = pictureId;
			this.comment = comment;
			super(EDIT_COMMENT_EVENT);
		}
		
		override public function clone():Event
		{
			return new EditCommentEvent(pictureId, comment);
		}
	}
}