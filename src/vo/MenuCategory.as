package vo
{
	import mx.collections.ArrayCollection;
	
	import util.Uuid;

	public class MenuCategory
	{
		public var uuid:String;
		public var name:String;
		public var menuSubCategories:ArrayCollection;
		
		public function MenuCategory()
		{
			uuid = new Uuid().toString();
			menuSubCategories = new ArrayCollection();
		}
		public function processConfigXML(xml:XML):void
		{
			name = xml.name.valueOf();
			var menuSubCategoryList:XMLList = xml.MenuSubCategory;
			for (var b:int=0; b<menuSubCategoryList.length(); b++)
			{
				var msc:MenuSubCategory = new MenuSubCategory();
				msc.processConfigXML(menuSubCategoryList[b]);
				menuSubCategories.addItem(msc);
			}
		}
	}
}