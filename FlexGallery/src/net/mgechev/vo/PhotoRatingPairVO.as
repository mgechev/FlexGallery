package net.mgechev.vo
{
	public class PhotoRatingPairVO
	{
		public var rating:Number;
		public var photoId:uint;
		
		public function PhotoRatingPairVO(photoId:uint, rating:Number)
		{
			this.rating = rating;
			this.photoId = photoId;
		}
	}
}