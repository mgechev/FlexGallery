package net.mgechev.events.picturecontrol
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;

	public class DeletePictureEvent extends CairngormEvent
	{
		public static const DELETE_PICTURE:String = "DeletePicture";
		public var pictureName:String;
		
		public function DeletePictureEvent(pictureName:String)
		{
			this.pictureName = pictureName;
			super(DELETE_PICTURE);
		}
		
		override public function clone():Event
		{
			return new DeletePictureEvent(pictureName);
		}
	}
}