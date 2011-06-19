package net.mgechev.events.gallery
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import spark.components.TextArea;
	

	public class CommentFieldControlEvent extends CairngormEvent
	{
		public static const COMMENT_FIELD_ENABLE_EVENT:String = "CommentFieldEnable";
		public var commentField:TextArea;
		
		
		public function CommentFieldControlEvent(commentField:TextArea)
		{
			this.commentField = commentField;
			super(COMMENT_FIELD_ENABLE_EVENT);
		}
		
		override public function clone():Event
		{
			return new CommentFieldControlEvent(commentField);
		}
	}
}