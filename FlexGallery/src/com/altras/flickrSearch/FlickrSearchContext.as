package com.altras.flickrSearch
{
	import com.altras.flickrSearch.controller.*;
	import com.altras.flickrSearch.controller.events.ImageSearchEvent;
	import com.altras.flickrSearch.controller.events.ThumbSelectEvent;
	import com.altras.flickrSearch.model.*;
	import com.altras.flickrSearch.model.events.FlickrDataEvent;
	import com.altras.flickrSearch.service.*;
	import com.altras.flickrSearch.view.*;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class FlickrSearchContext extends Context
	{
		public function FlickrSearchContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		override public function startup():void {
			injector.mapSingleton(FlickrDataEvent);
			injector.mapSingleton(FlickrSearchModel);
			injector.mapSingleton(ImageSearchEvent);
			injector.mapSingleton(ThumbSelectEvent);
			
			injector.mapSingletonOf(IFlickrSearchService,FlickrSearchService);
			injector.mapSingletonOf(IFlickrSearchResultParser, FlickrSearchResultParser);
			
			mediatorMap.mapView(FlickrSearchView, FlickrSearchViewMediator);
			mediatorMap.mapView(FlickrSelectedImage, FlickrSelectedImageMediator, null, false, false);
		
			commandMap.mapEvent(ImageSearchEvent.SEARCH, SearchCommand, ImageSearchEvent);
			commandMap.mapEvent(ThumbSelectEvent.SELECT, ThumbSelectCommand, ThumbSelectEvent);
		}
	}
}