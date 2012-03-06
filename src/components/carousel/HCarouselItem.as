package components.carousel
{
	import flash.geom.Rectangle;

	public class HCarouselItem
	{
		private var _imagePath:String;
		private var _uuid:String;
		private var _isMenuItem:Boolean;
		private var _allowsSubmission:Boolean;
		private var _submissionButtonDimensions:Rectangle;
		
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

		public function get allowsSubmission():Boolean
		{
			return _allowsSubmission;
		}
		
		public function set allowsSubmission(value:Boolean):void
		{
			_allowsSubmission = value;
		}
		
		public function get submissionButtonDimensions():Rectangle
		{
			return _submissionButtonDimensions;
		}
		
		public function set submissionButtonDimensions(value:Rectangle):void
		{
			_submissionButtonDimensions = value;
		}
	}
}