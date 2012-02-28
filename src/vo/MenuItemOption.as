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
	}
}