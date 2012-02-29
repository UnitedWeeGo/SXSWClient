package events
{
	import flash.events.Event;
	
	public class OrderEvent extends Event
	{
		public static const ORDER_CANCELLED:String = 'orderCancelled';
		public static const ORDER_COMPLETE:String = 'orderComplete';
		
		public function OrderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}