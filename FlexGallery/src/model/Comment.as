package model
{
	[Bindable]
	public class Comment
	{
		private var _byUser:String;
		private var _id:Number;
		private var _date:String;
		private var _content:String;
		
		public function get byUser():String
		{
			return _byUser;
		}
		
		public function set byUser(value:String):void
		{
			_byUser = value;
		}
		
		public function get commentId():Number
		{
			return _id;
		}
		
		public function set commentId(value:Number):void
		{
			_id = value;
		}
		
		public function get date():String
		{
			return _date;
		}
		
		public function set date(value:String):void
		{
			_date = value;
		}
		
		public function get content():String
		{
			return _content;
		}
		
		public function set content(value:String):void
		{
			_content = value;
		}
		
		public function Comment()
		{
		}
	}
}