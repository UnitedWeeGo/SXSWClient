package components.carousel
{
	public class HCarouselItem
	{
		private var _imagePath:String;
		private var _uuid:String;
		
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

		public function get uuid():String
		{
			return _uuid;
		}

		public function set uuid(value:String):void
		{
			_uuid = value;
		}


	}
}