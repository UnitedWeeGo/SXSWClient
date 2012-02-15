package components.carousel
{
	public class HCarouselItem
	{
		private var _imagePath:String;
		
		public function HCarouselItem()
		{
		}

		public function get imagePath():String
		{
			return _imagePath;
		}

		public function set imagePath(value:String):void
		{
			_imagePath = value;
		}

	}
}