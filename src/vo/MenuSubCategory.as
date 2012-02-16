package vo
{
	public class MenuSubCategory
	{
		public var name:String;
		public var menuItems:Vector.<MenuItem>;
		
		public function MenuSubCategory()
		{
			menuItems = new Vector.<MenuItem>();
		}
		public function processConfigXML(xml:XML):void
		{
			name = xml.name.valueOf();
			var menuItemList:XMLList = xml.MenuItem;
			for (var b:int=0; b<menuItemList.length(); b++)
			{
				var mi:MenuItem = new MenuItem();
				mi.processConfigXML(menuItemList[b]);
				menuItems.push(mi);
			}
		}
	}
}