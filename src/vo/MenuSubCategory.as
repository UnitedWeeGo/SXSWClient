package vo
{
	import mx.collections.ArrayCollection;

	public class MenuSubCategory
	{
		public var name:String;
		public var menuItems:ArrayCollection;
		
		public function MenuSubCategory()
		{
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