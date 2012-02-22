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
		private var _menuCategories:ArrayCollection;
		
		public function ConfigModel( pvt:SingletonEnforcer )
		{
			_heroCarouselItems = new ArrayCollection();
			_menuCategories = new ArrayCollection();
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
				_menuCategories.addItem(mc);
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
					ci.uuid = menuItem.uuid;
					ac.addItem(ci);
				}
			}
			return ac;
		}
		
		public function getMenuItemByUuid(uuid:String):MenuItem
		{
			for (var a:int=0; a<_menuCategories.length; a++)
			{
				var menuSubCategories:ArrayCollection = MenuCategory(_menuCategories[a]).menuSubCategories;
				for (var b:int=0; b<menuSubCategories.length; b++)
				{
					var menuItems:ArrayCollection = MenuSubCategory(menuSubCategories[b]).menuItems;
					for (var c:int=0; c<menuItems.length; c++)
					{
						var menuItem:MenuItem = MenuItem(menuItems[c]);
						if (menuItem.uuid == uuid) return menuItem;
					}
				}
			}
			return null;
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

		public function get menuCategories():ArrayCollection
		{
			return _menuCategories;
		}

		public function set menuCategories(value:ArrayCollection):void
		{
			_menuCategories = value;
		}

	}
}
internal class SingletonEnforcer{}