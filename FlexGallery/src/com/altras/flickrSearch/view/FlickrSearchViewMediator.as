package com.altras.flickrSearch.view
{
	import com.altras.flickrSearch.controller.events.*;
	import com.altras.flickrSearch.model.events.FlickrDataEvent;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.events.DataEvent;
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
		
		public function FlickrSearchViewMediator()
		{
			super();
		}
		override public function onRegister():void {
			trace("FlickrSearchViewMediator registered");
			
			eventMap.mapListener(view.searchBtn,MouseEvent.CLICK,onSearchClick,MouseEvent);
			eventMap.mapListener(view.searchTxt,FlexEvent.ENTER,onSearchEnter,FlexEvent);
			eventMap.mapListener(view,ThumbSelectEvent.SELECT,onThumbSelect,ThumbSelectEvent);
			eventMap.mapListener(eventDispatcher,FlickrDataEvent.DATA_UPDATED, onDataUpdated,FlickrDataEvent);
			
			view.searchTxt.text="bla,bla";
			processSearch();
			
			
		}
		private function onSearchClick(e:MouseEvent):void{
			processSearch();
		}
		private function onSearchEnter(e:MouseEvent):void{
			if (view.searchBtn.enabled)
				processSearch();
		}
		private function onThumbSelect(event:ThumbSelectEvent):void
		{
			trace("FlickrSearchViewMediator thumb selected");
			if (view.searchBtn.enabled)
				dispatch(event);
		}
		private function onDataUpdated(event:FlickrDataEvent):void{
			trace("FlickrSearchViewMediator data updated from model");
			view.thumbGroup.dataProvider = new ArrayCollection(event._data);
			view.searchBtn.enabled=true;
		}
		private function processSearch():void {
			if(view.searchTxt.text.length<3){
				Alert.show("Please enter search term minimum 3 characters","Error");
				return;
			}
			trace("FlickrSearchViewMediator processing to search");
			view.searchBtn.enabled=false;
			dispatch(new ImageSearchEvent(ImageSearchEvent.SEARCH,view.searchTxt.text));
			
		}
	}
}