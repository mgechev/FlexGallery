package com.altras.flickrSearch.view
{
	import com.altras.flickrSearch.events.*;
	import com.altras.flickrSearch.events.FlickrDataEvent;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.events.DataEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	import org.swiftsuspenders.Injector;

	public class FlickrSearchViewMediator extends Mediator
	{
		[Inject]
		public var view:FlickrSearchView;
		
		override public function onRegister():void 
		{
			eventMap.mapListener(view.searchButton,MouseEvent.CLICK, onSearchClick, MouseEvent);
			eventMap.mapListener(view.searchText,KeyboardEvent.KEY_DOWN, onSearchEnter, KeyboardEvent);
			eventMap.mapListener(view, ThumbSelectEvent.SELECT, onThumbSelect, ThumbSelectEvent);
			eventMap.mapListener(eventDispatcher, FlickrDataEvent.DATA_UPDATED, onDataUpdated, FlickrDataEvent);
			
			view.searchText.text="bikini";
		}
		
		private function onSearchClick(e:MouseEvent):void
		{
			trace("FlickrSearchViewMediator onSearchClick");
			
			processSearch();
		}
		
		private function onSearchEnter(event:KeyboardEvent):void
		{
			trace("FlickrSearchViewMediator onSearchEnter");
			if( event.keyCode == 13)
			if (view.searchButton.enabled)
				processSearch();
		}
		
		private function onThumbSelect(event:ThumbSelectEvent):void
		{
			trace("FlickrSearchViewMediator onThumbSelect");
			
			if (view.searchButton.enabled)
				dispatch(event);
		}
		
		private function onDataUpdated(event:FlickrDataEvent):void{
			trace("FlickrSearchViewMediator onDataUpdated");
			
			view.thumbGroup.dataProvider = new ArrayCollection(event._data);
			view.searchButton.enabled = true;
		}
		
		private function processSearch():void 
		{
			trace("FlickrSearchViewMediator processSearch");
			
			view.searchButton.enabled = false;
			
			dispatch(new ImageSearchEvent(ImageSearchEvent.SEARCH, view.searchText.text));
		}
		
	}
}