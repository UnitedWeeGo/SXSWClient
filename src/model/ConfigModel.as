package model
{
	import components.carousel.HCarouselItem;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;

	public class ConfigModel
	{
		public static var instance:ConfigModel;
		
		private var _heroCarouselItems:ArrayCollection;
		
		public function ConfigModel( pvt:SingletonEnforcer )
		{
			_heroCarouselItems = new ArrayCollection();
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
			for (var i:int=0; i<homeCarouselImageList.length(); i++)
			{
				var ci:HCarouselItem = new HCarouselItem();
				ci.imagePath = homeCarouselImageList[i].@source;
				_heroCarouselItems.addItem(ci);
			}
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