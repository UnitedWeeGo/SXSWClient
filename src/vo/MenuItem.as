package vo
{
	import mx.collections.ArrayCollection;
	
	import util.Uuid;

	public class MenuItem
	{
		public var uuid:String;
		public var name:String;
		public var price:Number;
		public var heroSource:String;
		public var menuItemOptions:ArrayCollection;
		
		public function MenuItem()
		{
			uuid = new Uuid().toString();
			menuItemOptions = new ArrayCollection();
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
				menuItemOptions.addItem(mio);
			}
		}
	}
}