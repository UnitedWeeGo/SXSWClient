package vo
{
	public class MenuItemOption
	{
		public var name:String;
		public var addlCost:Number;
		public var defaultOption:Boolean;
		
		public function MenuItemOption()
		{
			addlCost = 0;
			defaultOption = false;
		}
		public function processConfigXML(xml:XML):void
		{
			name = xml.name.valueOf();
			addlCost = isNaN( parseFloat(xml.@addlCost) ) ? 0 : parseFloat(xml.@addlCost);
			defaultOption = xml.@default == 'true';
		}
	}
}