package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import net.mgechev.vo.CommentVO;

	public class PictureCommentEvent extends CairngormEvent
	{
		public static const PICTURECOMMENTEVENT:String = "PictureCommentEvent";
		public var comment:CommentVO;
		
		public function PictureCommentEvent(comment:CommentVO)
		{
			this.comment = comment;
			super(PICTURECOMMENTEVENT);
		}
		
		override public function clone():Event
		{
			return new PictureCommentEvent(comment);
		}
	}
}