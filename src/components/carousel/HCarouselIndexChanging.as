package components.carousel
{
	import flash.events.Event;
	
	public class HCarouselIndexChanging extends Event
	{
		public static const INDEX_CHANGING:String = 'HCarouselIndexChanging';
		
		public function HCarouselIndexChanging(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}