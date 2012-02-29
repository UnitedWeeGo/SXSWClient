package service
{
	import events.ServiceEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import model.ConfigModel;
	import model.OrderModel;
	
	import mx.collections.ArrayCollection;
	
	import vo.MenuItem;
	
	public class OrderService extends EventDispatcher
	{
		public static var instance:OrderService;
		private var orderModel:OrderModel;
		private var configModel:ConfigModel;
		
		public static function getInstance():OrderService
		{
			if( instance == null ) instance = new OrderService( new SingletonEnforcer() );
			return instance;
		}
		
		public function OrderService( pvt:SingletonEnforcer )
		{
			orderModel = OrderModel.getInstance();
			configModel = ConfigModel.getInstance();
		}
		
		public function sendOrder():void
		{
			var xml:XML = 
				<Order instanceId={configModel.instanceId}>
					
				</Order>;
			
			for (var i:int=0; i<orderModel.orderedItems.length; i++)
			{
				var item:MenuItem = orderModel.orderedItems.getItemAt(i) as MenuItem;
				var node:XML = item.getXML();
				xml.appendChild(node);
			}
			var custnode:XML = orderModel.currentUserInfo.getXML();
			xml.appendChild(custnode);
			
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, dispatchOrderSuccess);
			xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, dispatchCallFail);
			
			var req:URLRequest = new URLRequest(configModel.endpoint);
			req.data = xml;
			req.method = URLRequestMethod.POST;
			req.contentType = "text/xml";
			
//			trace(xml.valueOf());
			xmlLoader.load(req);
			
		}
		
		private function cdata(data:String):XML 
		{
			return new XML("<![CDATA[" + data + "]]>");
		}
		
		// Success handlers
		private function dispatchOrderSuccess(event:Event):void
		{
			try 
			{
				var xml:XML = new XML(event.target.data);
				
				var ev:ServiceEvent;
				if (xml.@result == '200')
				{
					ev = new ServiceEvent(ServiceEvent.ORDER_SUCCESS);
				}
				else
				{
					ev = new ServiceEvent(ServiceEvent.ORDER_FAIL);
				}
			}
			catch (e:Error)
			{
				ev = new ServiceEvent(ServiceEvent.ORDER_FAIL);
			}
			dispatchEvent(ev);
		}
		
		// Fail handlers
		private function dispatchCallFail(event:IOErrorEvent):void
		{
			var ev:ServiceEvent = new ServiceEvent(ServiceEvent.ORDER_FAIL);
			dispatchEvent(ev);
		}
	}
}
internal class SingletonEnforcer{}