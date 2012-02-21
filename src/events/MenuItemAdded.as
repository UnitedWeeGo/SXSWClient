package events
{
	import flash.events.Event;
	
	import vo.MenuItem;
	
	public class MenuItemAdded extends Event
	{
		public static const MENU_ITEM_SELECTED:String = 'menuItemSelected';
		public var menuItem:MenuItem;
		
		public function MenuItemAdded(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}