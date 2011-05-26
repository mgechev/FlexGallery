package temp.model
{
	import mx.collections.ArrayCollection;
	
	import org.osmf.layout.AbsoluteLayoutFacet;

	public class Gallery
	{
		private _photos:ArrayCollection;
		
		public Gallery()
		{
			photos = new ArrayCollection();
		}
		
		public function set Photos(photos:ArrayCollection):void
		{
			_photos = photos;
		}
		
		public function get Photos():ArrayCollection
		{
			return _photos;
		}
	}
}