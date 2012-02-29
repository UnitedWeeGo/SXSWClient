package events
{
	import flash.events.Event;
	
	public class ServiceEvent extends Event
	{
		public static const ORDER_SUCCESS:String = 'orderSuccess';
		public static const ORDER_FAIL:String = 'orderFail';
		
		public var resultId:String;
		
		public function ServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}