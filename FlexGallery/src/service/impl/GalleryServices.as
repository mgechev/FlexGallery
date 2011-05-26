package service.impl
{
	import mx.rpc.AsyncToken;
	import mx.rpc.http.mxml.HTTPService;

	public class GalleryServices
	{
		public var service:HTTPService;
		
		public function getPicturesByUser(user:String):AsyncToken
		{
			service.request = new XML("<username>" + user + "</username>");
			return service.send();
		}
		
		public function getPictureComments(picture:Number):AsyncToken
		{
			service.request = new XML("<id>" + picture + "</id>");
			return service.send();
		}
		
		public function getPictures():AsyncToken
		{
			return service.send();
		}
		
		public function setPictureRating(picture:Number):AsyncToken
		{
			service.request = new XML("<id>" + picture + "</id>");
			return service.send();
		}
		
		public function getPictureRating(picture:Number):AsyncToken
		{
			service.request = new XML("<id>" + picture + "</id>");
			return service.send();
		}
		
		public function setPictureComment(picture:Number, commentContent:String):AsyncToken
		{
			service.request = new XML("<id>" + picture + "</id>" +
				"<content>" + commentContent + "</content>");
			return service.send();
		}
	}
}