package vo
{
	import mx.collections.ArrayCollection;
	
	import util.Uuid;

	public class MenuSubCategory
	{
		public var uuid:String;
		public var name:String;
		public var menuItems:ArrayCollection;
		
		public function MenuSubCategory()
		{
			uuid = new Uuid().toString();
			menuItems = new ArrayCollection();
		}
		
		public function processConfigXML(xml:XML):void
		{
			name = xml.name.valueOf();
			var menuItemList:XMLList = xml.MenuItem;
			for (var b:int=0; b<menuItemList.length(); b++)
			{
				var mi:MenuItem = new MenuItem();
				mi.processConfigXML(menuItemList[b]);
				menuItems.addItem(mi);
			}
		}
	}
}