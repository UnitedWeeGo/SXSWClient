package events
{
	import flash.events.Event;
	
	import vo.MenuItemOption;
	
	public class MenuItemOptionRemoved extends Event
	{
		public static const ITEM_REMOVED:String = 'iRemoved';
		public var menuItemOption:MenuItemOption;
		
		public function MenuItemOptionRemoved(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}