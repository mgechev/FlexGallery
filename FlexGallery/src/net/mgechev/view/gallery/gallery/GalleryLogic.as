package net.mgechev.view.gallery.gallery
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Text;
	import mx.effects.Fade;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	
	import net.mgechev.events.gallery.CommentFieldControlEvent;
	import net.mgechev.events.gallery.GalleryInitializationEvent;
	import net.mgechev.events.gallery.GalleryKeyPressedEvent;
	import net.mgechev.events.gallery.LoadPicturesEvent;
	import net.mgechev.events.gallery.PictureCommentEvent;
	import net.mgechev.events.gallery.PictureVoteEvent;
	import net.mgechev.events.gallery.StartSlideShowEvent;
	import net.mgechev.events.gallery.StopSlideShowEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.CommentVO;
	
	import org.rockholla.controls.panzoom.PanZoomComponent;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.TextArea;
	import spark.components.VSlider;
	import spark.events.IndexChangeEvent;
	
	public class GalleryLogic extends Group
	{
		
		[Bindable]
		public var inSlideshowState:Boolean = false;
		private var changeSlideshowPictureTimer:Timer;
		[Bindable]
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		[Bindable]
		public var commentsProvider:ArrayCollection;
		[Bindable]
		public var picturesProvider:ArrayCollection;	
		[Bindable]
		public var isUserpanelEnabled:Boolean = false;
		[Bindable]
		public var picturesList:List;
		
		public var selectedUserId:Number;
		
		public var show:Fade;
		public var panzoom:PanZoomComponent;
		public var usersList:List;
		public var commentsList:List;
		public var commentField:TextArea;
		public var ratingLabel:Label;
		public var voteInput:VSlider;
		public var pictureComment:Text;
		public var previousButton:Button;
		public var nextButton:Button;
		public var btnSlideshow:Button;
		public var btnStopSlideshow:Button;
		
		public function GalleryLogic()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, init);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		}
		
		private function keyPressed(event:Event):void
		{
			(new GalleryKeyPressedEvent(this)).dispatch();
		}
		
		
		private function init(event:Event):void
		{				
			show = new Fade(panzoom);
			show.alphaTo = 1;
			show.alphaFrom = 0;
			show.duration = 700;
			
			(new GalleryInitializationEvent(this)).dispatch();
			
			btnSlideshow.addEventListener(MouseEvent.CLICK, startSlideshow);
			nextButton.addEventListener(MouseEvent.CLICK, nextPageButtonPressed);
			previousButton.addEventListener(MouseEvent.CLICK, previousPageButtonPressed);
			voteInput.addEventListener(DragEvent.DRAG_COMPLETE, sendVote);
			commentField.addEventListener(KeyboardEvent.KEY_DOWN, sendComment);
			picturesList.addEventListener(IndexChangeEvent.CHANGE, scalePicture);
			usersList.addEventListener(IndexChangeEvent.CHANGE, loadUserPictures);
			btnStopSlideshow.addEventListener(MouseEvent.CLICK, stopSlideshow);
		}
		
		public function startSlideshow(event:Event):void
		{
			(new StartSlideShowEvent(this)).dispatch();
		}
		
		public function stopSlideshow(event:Event):void
		{
			(new StopSlideShowEvent(this)).dispatch();
		}
		
		private function stopSlideshowHandle(event:Event):void
		{
			var stopSlideshow:StopSlideShowEvent = new StopSlideShowEvent(this);
			stopSlideshow.dispatch();
		}
		
		public function maximizeLeftPicture():Boolean
		{
			var selectedPictureIndex:uint = modelLocator.picturesList.getItemIndex(modelLocator.selectedPicture);
			if (selectedPictureIndex > 0)
			{
				modelLocator.selectedPicture = modelLocator.picturesList[selectedPictureIndex - 1];
				return true;
			}
			else
			{
				if (previousPage())
				{
					modelLocator.selectedPicture = modelLocator.picturesList[modelLocator.picturesList.length - 1];
					return true;
				}					
			}
			return false;
		}
		
		public function maximizeRightPicture():Boolean
		{
			var selectedPictureIndex:uint = modelLocator.picturesList.getItemIndex(modelLocator.selectedPicture);
			if (selectedPictureIndex < picturesList.dataProvider.length - 1)
			{
				modelLocator.selectedPicture = modelLocator.picturesList[selectedPictureIndex + 1];
				return true;
			}
			else
			{
				if (nextPage())
				{
					modelLocator.selectedPicture = modelLocator.picturesList[0];
					return true;
				}					
			}
			return false;
		}
		
		protected function loadUserPictures(event:Event):void				
		{
			selectedUserId = usersList.selectedItem.id;
			getPictures(0);				
		}
		
		protected function scalePicture(event:Event):void
		{
			modelLocator.selectedPicture = picturesList.selectedItem;
			modelLocator.selectedPictureComments = modelLocator.selectedPicture.commentsList;
			show.play();
		}
		
		
		protected function sendComment(event:KeyboardEvent):void
		{
			if (event.keyCode == 13)
			{
				btnSlideshow.setFocus();
				commentField.enabled = false;
				var currentDate:Date = new Date();
				var date:String = currentDate.fullYear + "-" + 
					(currentDate.monthUTC + 1) + "-" + 
					currentDate.date + " "
					+ currentDate.hours + ":" + 
					currentDate.minutes + ":" + currentDate.seconds;
				var comment:CommentVO = new CommentVO(commentField.text, modelLocator.username, 
					date, modelLocator.selectedPicture.id);
				
				modelLocator.selectedPicture.commentsList.addItem(comment);
				
				var pictureCommentEvent:PictureCommentEvent = 
					new PictureCommentEvent(comment);
				pictureCommentEvent.dispatch();
				
				var commentFieldEvent:CommentFieldControlEvent = 
					new CommentFieldControlEvent(commentField);
				
				commentFieldEvent.dispatch();
				
			}				
		}
		
		protected function enableComments(e:TimerEvent):void
		{
			commentField.enabled = true;
		}
		
		protected function sendVote(event:Event):void
		{
			if (!modelLocator.picturesVoted.contains(picturesList.selectedItem.id))
			{
				var pictureVoteEvent:PictureVoteEvent = 
					new PictureVoteEvent(picturesList.selectedItem.id, voteInput.value);
				pictureVoteEvent.dispatch();
			}
		}
		
		protected function nextPageButtonPressed(event:Event):void
		{
			nextPage();
		}
		
		protected function previousPageButtonPressed(event:Event):void
		{
			previousPage();
		}
		
		protected function nextPage():Boolean
		{
			if (modelLocator.picturesList.length > ViewModelLocator.PICTURES_PER_PAGE - 1)
			{
				modelLocator.pageReached = modelLocator.pageReached + 1;
				getPictures(modelLocator.pageReached);
				return true;
			}
			return false;
		}
		
		protected function previousPage():Boolean
		{
			if (modelLocator.pageReached > 0)
			{
				modelLocator.pageReached = modelLocator.pageReached - 1;
				getPictures(modelLocator.pageReached);
				return true;
			}
			return false;
		}
		
		
		protected function getPictures(page:uint):void
		{
			var loadPicturesEvent:LoadPicturesEvent = 
				new LoadPicturesEvent(page,selectedUserId);
			loadPicturesEvent.dispatch();			
		}
		
		
		/*
		Zooming
		*/
		
		import spark.components.BorderContainer;
		import spark.components.Button;
		
		public static const MAX_ZOOM:Number = 4;
		public static const MIN_ZOOM:Number = 0.3;
	}
}