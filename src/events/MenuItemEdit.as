package events
{
	import flash.events.Event;
	
	import vo.MenuItem;
	
	public class MenuItemEdit extends Event
	{
		public static const MENU_ITEM_EDIT:String = 'menuItemEdit';
		public static const MENU_ITEM_REMOVE:String = 'menuItemRemove';
		public var menuItem:MenuItem;
		
		public function MenuItemEdit(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}