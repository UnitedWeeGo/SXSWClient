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
		public var hasBeenAddedToOrder:Boolean = false;
				
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
		public function totalPriceWithOptions():Number
		{
			var total:Number = 0;
						
			total += price;
			for (var i:int=0; i<menuItemOptions.length; i++)
			{
				var mio:MenuItemOption = menuItemOptions[i] as MenuItemOption;
				if (mio.addedOption) total+= mio.addlCost;
			}
			return total;
		}
	}
}