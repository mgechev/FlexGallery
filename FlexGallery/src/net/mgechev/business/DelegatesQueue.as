package net.mgechev.business
{
	import mx.collections.ArrayCollection;

	public class DelegatesQueue
	{
		private static var _instance:DelegatesQueue;
		public static function get instance():DelegatesQueue
		{
			if (_instance == null)
				new DelegatesQueue();
			
			return _instance;
		}
		
		private var servicesQueue:ArrayCollection = new ArrayCollection();
		
		private var canExecute:Boolean = true;
		
		private var pendingDelegate:IDelegate;
		
		public function DelegatesQueue()
		{
			if (_instance != null) 
				throw new Error("Trying to create multiple instances of a singleton component");
			
			_instance = this;
		}
		
		/**
		 * After Delegate creation, all commands ensure to call registerDelegate:
		 */ 
		public function registerDelegate(delegate:IDelegate):void
		{
			servicesQueue.addItemAt(delegate, 0);
			executeServiceCall();
		}
		
		/**
		 * On result or fault each delegate ensures to call unregisterDelegate:
		 */ 
		public function unregisterDelegate(delegate:IDelegate):void
		{
			if (delegate == pendingDelegate)
			{
				servicesQueue.removeItemAt(servicesQueue.getItemIndex(delegate));
				pendingDelegate = null;
				
				trace("STOP execute delegate: " +  delegate);
			}
			executeServiceCall();
		}
		
		protected function executeServiceCall():void
		{
			if (pendingDelegate == null)
			{
				if (servicesQueue.length == 0) return;
				
				pendingDelegate = servicesQueue.getItemAt(servicesQueue.length - 1) as IDelegate;
				
				if (pendingDelegate != null)
					pendingDelegate.execute();
				
				trace("START execute delegate: " + pendingDelegate);
			}
		}
		
	}
}