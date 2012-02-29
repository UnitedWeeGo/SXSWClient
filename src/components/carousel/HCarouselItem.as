package components.carousel
{
	public class HCarouselItem
	{
		private var _imagePath:String;
		private var _uuid:String;
		private var _isMenuItem:Boolean;
		
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

		public function get isMenuItem():Boolean
		{
			return _isMenuItem;
		}

		public function set isMenuItem(value:Boolean):void
		{
			_isMenuItem = value;
		}


	}
}