package net.mgechev.vo
{
	[Bindable]
	public class PhotoVO
	{
		public var name:String;
		public var source:String;
		public var _creator:String;
		public var size:uint;
		public var id:Number;
		public var comment:String;
		
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