package vo
{
	import mx.collections.ArrayCollection;
	
	import util.Uuid;

	public class MenuItem
	{
		public var uuid:String;
		public var name:String;
		public var categoryFriendlyName:String;
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
		public function clone():MenuItem
		{
			var mi:MenuItem = new MenuItem();
//			mi.uuid = uuid;
			mi.name = name;
			mi.price = price;
			mi.heroSource = heroSource;
			mi.hasBeenAddedToOrder = hasBeenAddedToOrder;
			mi.categoryFriendlyName = categoryFriendlyName;
			for (var i:int=0; i<menuItemOptions.length; i++)
			{
				var newMio:MenuItemOption = MenuItemOption(menuItemOptions.getItemAt(i)).clone();
				mi.menuItemOptions.addItem(newMio);
			}
			return mi;
		}
		
		public function getXML():XML
		{
			var xml:XML = 
				<MenuItem itemPrice={price}>
					<categoryFriendlyName>{cdata(categoryFriendlyName)}</categoryFriendlyName>
					<name>{cdata(name)}</name>
				</MenuItem>;
			for (var i:int=0; i<menuItemOptions.length; i++)
			{
				var mio:MenuItemOption = menuItemOptions.getItemAt(i) as MenuItemOption;
				if (mio.addedOption)
				{
					var node:XML = mio.getXML();
					xml.appendChild(node);
				}
			}
			return xml;
		}
		private function cdata(data:String):XML 
		{
			return new XML("<![CDATA[" + data + "]]>");
		}
		
	}
}