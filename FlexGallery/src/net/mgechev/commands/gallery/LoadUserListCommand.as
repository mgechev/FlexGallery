package net.mgechev.commands.gallery
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.gallery.LoadUserListDelegate;
	import net.mgechev.events.gallery.LoadUserListEvent;
	import net.mgechev.model.ViewModelLocator;
	import net.mgechev.vo.UserVO;

	public class LoadUserListCommand implements ICommand, IResponder
	{
		
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		private var delegate:LoadUserListDelegate;
		
		public function LoadUserListCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			var loadUserListEvent:LoadUserListEvent = event as LoadUserListEvent;
			delegate = new LoadUserListDelegate(this);
			modelLocator.pushService(delegate);
		}
		
		public function result(event:Object):void
		{
			modelLocator.usersList = new ArrayCollection();
			if (event.result.user.length > 0)
			{
				for (var i:uint = 0; i < event.result.user.length; i++)
				{					
					modelLocator.usersList.addItem(new UserVO(event.result.user[i].username, "", event.result.user[i].id));
				}
			}
			else					
			{
				modelLocator.usersList.addItem(new UserVO(event.result.user.username, "", event.result.user.id));
			}
			modelLocator.dequeue(delegate);
			modelLocator.executeService();
		}
		
		public function fault(event:Object):void
		{
			
		}
		
	}
}