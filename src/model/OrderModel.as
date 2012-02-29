package model
{
	import mx.collections.ArrayCollection;
	
	import vo.MenuItem;
	import vo.Customer;

	public class OrderModel
	{
		private static var instance:OrderModel;
		
		[Bindable]
		public var currentTotal:Number;
		
		public var instanceId:String;
		
		private var _orderedItems:ArrayCollection;
		private var _currentUserInfo:Customer;
		
		public function OrderModel( pvt:SingletonEnforcer )
		{
			orderedItems = new ArrayCollection();
		}
		
		public static function getInstance():OrderModel
		{
			if( instance == null ) instance = new OrderModel( new SingletonEnforcer() );
			return instance;
		}
		
		public function addItem(value:MenuItem):void
		{
//			trace('item added');
			value.hasBeenAddedToOrder = true;
			orderedItems.addItem(value);
		}
		public function updateItem(value:MenuItem):void
		{
//			trace('item previously added, update');
			var l:int = _orderedItems.length;
			for (var i:int=0; i<l; i++)
			{
				var mi:MenuItem = _orderedItems[i] as MenuItem;
				if (mi.uuid == value.uuid)
				{
					_orderedItems.removeItemAt(i);
					_orderedItems.addItemAt(value,i);
				}
			}
		}
		
		public function removeItem(value:MenuItem):void
		{
			var l:int = _orderedItems.length;
			for (var i:int=0; i<l; i++)
			{
				var mi:MenuItem = _orderedItems[i] as MenuItem;
				if (mi.uuid == value.uuid)
				{
					_orderedItems.removeItemAt(i);
					return;
				}
			}
		}
		
		public function clearOrder():void
		{
			orderedItems.removeAll();
			_currentUserInfo = null;
		}

		[Bindable]
		public function get orderedItems():ArrayCollection
		{
			return _orderedItems;
		}

		public function set orderedItems(value:ArrayCollection):void
		{
			_orderedItems = value;
		}

		public function set currentUserInfo(value:Customer):void
		{
			_currentUserInfo = value;
		}
		public function get currentUserInfo():Customer
		{
			return _currentUserInfo;
		}

	}
}

internal class SingletonEnforcer{}