package net.mgechev.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.net.FileReference;
	
	import mx.collections.ArrayCollection;

	public class UploadEvent extends CairngormEvent
	{
		public static const UPLOAD:String = "Upload";
		public var picture:FileReference;
		
		public function UploadEvent(picture:FileReference)
		{
			this.picture = picture;
			super(UPLOAD);
		}
		
		override public function clone():Event
		{
			return new UploadEvent(picture);
		}
	}
}