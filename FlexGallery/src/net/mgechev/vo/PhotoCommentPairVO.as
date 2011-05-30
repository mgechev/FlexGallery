package net.mgechev.vo
{
	public class PhotoCommentPairVO
	{
		public var photoId:uint;
		public var comment:String;
		
		public function PhotoCommentPairVO(photoId:uint, comment:String)
		{
			this.photoId = photoId;
			this.comment = comment;
		}
	}
}