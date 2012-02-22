package components.menuItemSelector
{
	import spark.components.Image;
	import spark.components.SpinnerListItemRenderer;
	
	public class MenuOptionSpinnerListItemRenderer extends SpinnerListItemRenderer
	{
		public function MenuOptionSpinnerListItemRenderer()
		{
			//TODO: implement function
			super();
		}
		
		import vo.MenuItemOption;
		
		override public function set data(value:Object):void
		{
			super.data = value;
//			var mi:MenuItemOption = MenuItemOption(value);				
//			optionName.text = mi.name;
		}
//		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
//		{
//			graphics.beginFill(0x92ADC2, .7);
//			graphics.lineStyle();
//			graphics.drawRect(0, 0, unscaledWidth,unscaledHeight);
//			graphics.endFill();
//		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			var img:Image = new Image();
			img.source = 'assets/miscUI/addItemPlusButton.png';
			this.addChild(img);
		}
	}
}