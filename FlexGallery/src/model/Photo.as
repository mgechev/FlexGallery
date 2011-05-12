package model
{
	import flashx.textLayout.formats.Float;

	[Bindable]
	public class Photo
	{
		private var _name:String;
		private var _source:String;
		private var _creator:String;
		private var _size:uint;
		private var _id:Number;
		private var _comment:String;
		
		public function get comment():String
		{
			return _comment;
		}
		
		public function set comment(value:String):void
		{
			_comment = value;
		}
		
		public function get photoId():Number
		{
			return _id;
		}
		
		public function set photoId(value:Number):void
		{
			_id = value;
		}
		
		public function get source():String
		{
			return _source;
		}
		
		public function set source(value:String):void
		{
			_source = value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get size():uint
		{
			return _size;
		}
		
		public function set size(value:uint):void
		{
			_size = value;
		}
		
		public function get creator():String
		{
			return _creator;
		}
		
		public function set creator(value:String):void
		{
			if (value == null || value.length == 0)
			{
				value = "Unknown";
			}
			_creator = value;
		}
	}
}