package vo
{
	public class Customer
	{
		public var name:String = '';
		public var title:String = '';
		public var email:String = '';
		public var phoneNumber:String = '';
		
		public function Customer()
		{
			
		}
		public function getXML():XML
		{
			var xml:XML = 
				<Customer>
					<name>{cdata(name)}</name>
					<title>{cdata(title)}</title>
					<email>{cdata(email)}</email>
					<phoneNumber>{cdata(phoneNumber)}</phoneNumber>
				</Customer>;
			
			return xml;
		}
		private function cdata(data:String):XML 
		{
			return new XML("<![CDATA[" + data + "]]>");
		}
	}
}