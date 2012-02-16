package vo
{
	public class MenuItem
	{
		public var name:String;
		public var price:Number;
		public var heroSource:String;
		public var menuItemOptions:Vector.<MenuItemOption>;
		
		public function MenuItem()
		{
			menuItemOptions = new Vector.<MenuItemOption>();
		}
		public function processConfigXML(xml:XML):void
		{
			name = xml.name.valueOf();
			price = parseFloat(xml.@itemPrice);
			heroSource = xml.@heroSource;
			var menuItemOptionList:XMLList = xml.MenuItemOption;
			for (var b:int=0; b<menuItemOptionList.length(); b++)
			{
				var mio:MenuItemOption = new MenuItemOption();
				mio.processConfigXML(menuItemOptionList[b]);
				menuItemOptions.push(mio);
			}
		}
	}
}