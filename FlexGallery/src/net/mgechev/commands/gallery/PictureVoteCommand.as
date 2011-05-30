package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.PictureVoteDelegate;
	import net.mgechev.events.gallery.PictureVoteEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.PageUserPairVO;
	import net.mgechev.vo.PhotoRatingPairVO;

	public class PictureVoteCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		public var lastVote:uint;
		private var delegate:PictureVoteDelegate;
		
		public function PictureVoteCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var pictureVote:PictureVoteEvent = event as PictureVoteEvent;
			delegate = new PictureVoteDelegate(this, new PhotoRatingPairVO(pictureVote.pictureId, pictureVote.rating));
			lastVote = pictureVote.rating;
			modelLocator.picturesVoted.addItem(pictureVote.pictureId);
			modelLocator.pushService(delegate);
		}
		
		public function result(event:Object):void
		{			
			modelLocator.selectedPicture.votesCount++;
			modelLocator.selectedPicture.ratingSum += lastVote;
			modelLocator.selectedPicture.rating = 
				modelLocator.selectedPicture.ratingSum / modelLocator.selectedPicture.votesCount;
			modelLocator.dequeue(delegate);
			modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}