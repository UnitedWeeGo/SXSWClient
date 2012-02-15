package skins
{
	import assets.fxg.CustomTabbedViewNavigatorButtonBarButton_down;
	import assets.fxg.CustomTabbedViewNavigatorButtonBarButton_selected;
	import assets.fxg.CustomTabbedViewNavigatorButtonBarButton_up;
	
	import mx.core.DPIClassification;
	
	import spark.skins.mobile.assets.TabbedViewNavigatorButtonBarFirstButton_down;
	import spark.skins.mobile.assets.TabbedViewNavigatorButtonBarFirstButton_up;
	import spark.skins.mobile.supportClasses.TabbedViewNavigatorTabBarTabSkinBase;
	import spark.skins.mobile320.assets.TabbedViewNavigatorButtonBarFirstButton_down;
	import spark.skins.mobile320.assets.TabbedViewNavigatorButtonBarFirstButton_up;
	
	/**
	 *  Skin for the left-most button in the TabbedViewNavigator ButtonBar skin
	 *  part.
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 2.5 
	 *  @productversion Flex 4.5
	 */
	public class CustomTabbedViewNavigatorTabBarTabSkin extends TabbedViewNavigatorTabBarTabSkinBase
	{
		/**
		 *  Constructor.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 2.5
		 *  @productversion Flex 4.5
		 */
		public function CustomTabbedViewNavigatorTabBarTabSkin()
		{
			super();
			
			switch (applicationDPI)
			{
				case DPIClassification.DPI_320:
				{
//					upBorderSkin = spark.skins.mobile320.assets.TabbedViewNavigatorButtonBarFirstButton_up;
//					downBorderSkin = spark.skins.mobile320.assets.TabbedViewNavigatorButtonBarFirstButton_down;
//					selectedBorderSkin = spark.skins.mobile320.assets.TabbedViewNavigatorButtonBarFirstButton_selected;
					
					upBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_up;
					downBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_down;
					selectedBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_selected;
					
					break;
				}
				default:
				{
					upBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_up;
					downBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_down;
					selectedBorderSkin = assets.fxg.CustomTabbedViewNavigatorButtonBarButton_selected;
					break;
				}
			}
		}
	}
}