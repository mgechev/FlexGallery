package net.mgechev.vo
{
	public class PageUserPairVO
	{
		public var pageNumber:uint;
		public var userId:int;
		public function PageUserPairVO(pageNumber:uint, userId:int)
		{
			this.pageNumber = pageNumber;
			this.userId = userId;
		}
	}
}