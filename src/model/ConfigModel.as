package model
{
	import components.carousel.HCarouselItem;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;
	
	import vo.MenuCategory;
	import vo.MenuItem;
	import vo.MenuSubCategory;

	public class ConfigModel
	{
		public static var instance:ConfigModel;
		
		private var _heroCarouselItems:ArrayCollection;
		private var _menuCategories:Vector.<MenuCategory>;
		
		public function ConfigModel( pvt:SingletonEnforcer )
		{
			_heroCarouselItems = new ArrayCollection();
			_menuCategories = new Vector.<MenuCategory>();
			//loadTestData();
			loadConfig();
		}

		public static function getInstance():ConfigModel
		{
			if( instance == null ) instance = new ConfigModel( new SingletonEnforcer() );
			return instance;
		}
		
		private function loadTestData():void
		{
			
		}
		
		private function loadConfig():void
		{
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, processConfigXML);
			xmlLoader.load(new URLRequest("config/config.xml"));
		}
		
		private function processConfigXML(e:Event):void
		{
			var cXML:XML = new XML(e.target.data);
			var homeCarouselImageList:XMLList = cXML.homeCarouselImages.image;
			for (var a:int=0; a<homeCarouselImageList.length(); a++)
			{
				var ci:HCarouselItem = new HCarouselItem();
				ci.imagePath = homeCarouselImageList[a].@source;
				_heroCarouselItems.addItem(ci);
			}
			// MenuCategory passed XML, child objects created internally
			var menuCategoryList:XMLList = cXML.MenuCategory;
			for (var b:int=0; b<menuCategoryList.length(); b++)
			{
				var mc:MenuCategory = new MenuCategory();
				mc.processConfigXML(menuCategoryList[b]);
				_menuCategories.push(mc);
			}
		}
		
		public function getCarouselItemsPerMenuCategoryWithIndex(index:int):ArrayCollection
		{
			var ac:ArrayCollection = new ArrayCollection();
			var menuCategory:MenuCategory = _menuCategories[index];
			for (var a:int=0; a<menuCategory.menuSubCategories.length; a++)
			{
				var menuSubCategory:MenuSubCategory = menuCategory.menuSubCategories[a];
				for (var b:int=0; b<menuSubCategory.menuItems.length; b++)
				{
					var menuItem:MenuItem = menuSubCategory.menuItems[b];
					if (menuItem.heroSource.length == 0) continue;
					var ci:HCarouselItem = new HCarouselItem();
					ci.imagePath = menuItem.heroSource;
					ac.addItem(ci);
				}
			}
			return ac;
		}
		
		// Getters / Setters
		[Bindable]
		public function get heroCarouselItems():ArrayCollection
		{
			return _heroCarouselItems;
		}
		
		public function set heroCarouselItems(value:ArrayCollection):void
		{
			_heroCarouselItems = value;
		}
	}
}
internal class SingletonEnforcer{}