package com.altras.flickrSearch.controller
{
	import com.altras.flickrSearch.events.ThumbSelectEvent;
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	import com.altras.flickrSearch.view.FlickrSelectedImageMediator;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.display.DisplayObject;
	
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.TitleWindow;

	public class ThumbSelectCommand extends Command
	{
		[Inject]
		public var thumbSelectEvent:ThumbSelectEvent;
		[Inject]
		public var model:FlickrSearchModel;
		
		override public function execute():void{
			trace("ThumbSelectCommand executed" + thumbSelectEvent._data.bigImageSrc);
			
			model.selectedThumb = thumbSelectEvent._data as FlickrThumbVO;
			
			var selectedImage:FlickrSelectedImage  = new FlickrSelectedImage();
			var bigImage:TitleWindow = PopUpManager.createPopUp(contextView, FlickrSelectedImage, true) as TitleWindow;
			var bigImageControl:FlickrSelectedImage = bigImage as FlickrSelectedImage;
			
			mediatorMap.createMediator(bigImage);
			PopUpManager.centerPopUp(bigImage);
			
			bigImageControl.bigImage.source = model.selectedThumb.bigImageSrc;
			bigImage.x = 30;
			bigImageControl.x = 30;
			
		}
		
	}
}