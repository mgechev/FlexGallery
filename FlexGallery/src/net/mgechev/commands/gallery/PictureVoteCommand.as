package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.core.UIComponent;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.PictureVoteDelegate;
	import net.mgechev.events.gallery.PictureVoteEvent;
	import net.mgechev.model.ViewModelLocator;

	public class PictureVoteCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		public var lastVote:uint;
		
		public function PictureVoteCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var pictureVote:PictureVoteEvent = event as PictureVoteEvent;
			var delegate:PictureVoteDelegate = new PictureVoteDelegate(this);
			lastVote = pictureVote.rating;
			modelLocator.picturesVoted.addItem(pictureVote.pictureId);
			delegate.vote(pictureVote.pictureId, pictureVote.rating);
		}
		
		public function result(event:Object):void
		{
			modelLocator.pictureRatingCount++;
			modelLocator.pictureRatingSum += lastVote;
			modelLocator.pictureRating = modelLocator.pictureRatingSum / modelLocator.pictureRatingCount;
		}
		
		public function fault(event:Object):void
		{
			
		}
	}
}