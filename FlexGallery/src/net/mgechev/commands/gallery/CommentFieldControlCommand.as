package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.mgechev.events.gallery.CommentFieldControlEvent;
	
	import org.osmf.events.TimeEvent;
	
	import spark.components.TextArea;

	public class CommentFieldControlCommand implements ICommand
	{
		private var commentField:TextArea;
				
		public function execute(event:CairngormEvent):void
		{
			var commentFieldEnableEvent:CommentFieldControlEvent = event as CommentFieldControlEvent;
			commentField = commentFieldEnableEvent.commentField;
			commentField.enabled = false;
			commentField.text = "";
			var timer:Timer = new Timer(5000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, enable);
			timer.start();
		}
		
		public function enable(event:Event):void
		{
			this.commentField.enabled = true;
		}
	}
}