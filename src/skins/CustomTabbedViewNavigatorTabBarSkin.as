package skins
{
	import spark.components.ButtonBarButton;
	import spark.components.DataGroup;
	import spark.skins.mobile.ButtonBarSkin;
	import spark.skins.mobile.supportClasses.ButtonBarButtonClassFactory;
	import spark.skins.mobile.supportClasses.TabbedViewNavigatorTabBarHorizontalLayout;
	
	/**
	 *  The default skin class for the Spark TabbedViewNavigator tabBar skin part.
	 *  
	 *  @see spark.components.TabbedViewNavigator#tabBar
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 2.5
	 *  @productversion Flex 4.5
	 */
	public class CustomTabbedViewNavigatorTabBarSkin extends ButtonBarSkin
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 2.5 
		 *  @productversion Flex 4.5
		 * 
		 */
		public function CustomTabbedViewNavigatorTabBarSkin()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			if (!firstButton)
			{
				firstButton = new ButtonBarButtonClassFactory(ButtonBarButton);
				firstButton.skinClass = skins.CustomTabbedViewNavigatorTabBarTabSkin;
			}
			
			if (!lastButton)
			{
				lastButton = new ButtonBarButtonClassFactory(ButtonBarButton);
				lastButton.skinClass = skins.CustomTabbedViewNavigatorTabBarTabSkin;
			}
			
			if (!middleButton)
			{
				middleButton = new ButtonBarButtonClassFactory(ButtonBarButton);
				middleButton.skinClass = skins.CustomTabbedViewNavigatorTabBarTabSkin;
			}
			
			if (!dataGroup)
			{
				// TabbedViewNavigatorButtonBarHorizontalLayout for even percent layout
				var tabLayout:TabbedViewNavigatorTabBarHorizontalLayout = 
					new TabbedViewNavigatorTabBarHorizontalLayout();
				tabLayout.useVirtualLayout = false;
				
				dataGroup = new DataGroup();
				dataGroup.layout = tabLayout;
				addChild(dataGroup);
			}
		}
		
		/**
		 *  @private
		 */
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.drawBackground(unscaledWidth, unscaledHeight);
			
			// backgroundAlpha style is not supported by ButtonBar
			// TabbedViewNavigatorSkin sets a hard-coded value to support
			// overlayControls
			var backgroundAlphaValue:* = getStyle("backgroundAlpha");
			var backgroundAlpha:Number = (backgroundAlphaValue === undefined)
				? 1 : getStyle("backgroundAlpha");
			
			graphics.beginFill(getStyle("chromeColor"), backgroundAlpha);
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
		}
	}
}