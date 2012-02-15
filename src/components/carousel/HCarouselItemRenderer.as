package components.carousel
{
	import spark.components.Image;
	import spark.components.supportClasses.ItemRenderer;
	
	public class HCarouselItemRenderer extends ItemRenderer
	{
		private var _cItemImg:Image;
		
		public function HCarouselItemRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			invalidateDisplayList();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			/*
			graphics.clear();
			graphics.beginFill(data as Number);
			graphics.drawRect(0, 0, unscaledWidth/2, unscaledHeight/2);
			graphics.endFill();
			*/
			if (!data is HCarouselItem) return;
			
			if (!_cItemImg)
			{
				_cItemImg = new Image();
				addElement(_cItemImg);
			}
			
			var item:HCarouselItem = data as HCarouselItem;
			_cItemImg.source = item.imagePath;
			
		}
	}
}