package net.mgechev.vo
{
	public class CommentVO
	{
		public var id:uint;
		public var content:String;
		public var author:String;
		public var time:String;
		
		public function CommentVO(content:String, author:String, time:String, id:uint = 0)
		{
			this.id = id;
			this.content = content;
			this.author = author;
			this.time = time;
		}
	}
}