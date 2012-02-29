package vo
{
	import util.Uuid;

	public class MenuItemOption
	{
		public var uuid:String;
		public var name:String;
		public var addlCost:Number;
		public var addedOption:Boolean;
		public var isSizeUpgrade:Boolean;
		
		public function MenuItemOption()
		{
			uuid = new Uuid().toString();
			addlCost = 0;
			addedOption = false;
		}
		public function processConfigXML(xml:XML):void
		{
			if (xml.@sizeUpgradeOption == "true")
			{
				isSizeUpgrade = true;
			}
			else
			{	
				addedOption = xml.@default == 'true';
			}
			name = xml.name.valueOf();
			addlCost = isNaN( parseFloat(xml.@addlCost) ) ? 0 : parseFloat(xml.@addlCost);
		}
		public function clone():MenuItemOption
		{
			var mio:MenuItemOption = new MenuItemOption();
//			mio.uuid = uuid;
			mio.name = name;
			mio.addlCost = addlCost;
			mio.addedOption = addedOption;
			mio.isSizeUpgrade = isSizeUpgrade;
			return mio;
		}
		public function getXML():XML
		{
			var xml:XML = 
				<MenuItemOption addlCost={addlCost}>
					<name>{cdata(name)}</name>
				</MenuItemOption>;
			
			return xml;
		}
		private function cdata(data:String):XML 
		{
			return new XML("<![CDATA[" + data + "]]>");
		}
	}
}