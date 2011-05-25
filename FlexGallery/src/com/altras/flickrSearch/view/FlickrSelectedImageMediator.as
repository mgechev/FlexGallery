package com.altras.flickrSearch.view
{
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionresults.InjectValueResult;
	public class FlickrSelectedImageMediator extends Mediator
	{
		[Inject]
		public var view:FlickrSelectedImage;
		[Inject]
		public var model:FlickrSearchModel;
		
		private var _loaded:Boolean = false;
		public function FlickrSelectedImageMediator()
		{
			super();
		}
		override public function onRegister():void{
			trace("FlickrSelectedImageMediator registered");
			view.title = "Loading Image";
			view.itemImage.source = model.selectedThumb.bigImageSrc;
			
			eventMap.mapListener(view.clickBtn,MouseEvent.CLICK,onLinkClick,MouseEvent);
			eventMap.mapListener(view,CloseEvent.CLOSE,onClose,CloseEvent);
			eventMap.mapListener(view.itemImage,Event.COMPLETE,onImageLoadComplete,Event);
		}
		private function onLinkClick(event:MouseEvent):void{
			navigateToURL(new URLRequest(model.selectedThumb.link),'_blank');
		}
		private function onImageLoadComplete(event:Event):void{
			view.title = model.selectedThumb.title;
			view.imgLoader.includeInLayout=view.imgLoader.visible=false;
			view.itemImage.includeInLayout=view.clickBtn.includeInLayout=false;
			view.percentWidth= view.percentHeight = 100;
			view.showEffect.play();
			_loaded=true
		}
		private function onClose(event:CloseEvent):void {
			if(!_loaded) {
				view.itemImage.source = null;
			}
			PopUpManager.removePopUp(view);
			mediatorMap.removeMediator(this);
		}
	}
}