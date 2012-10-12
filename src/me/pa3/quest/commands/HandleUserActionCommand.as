package me.pa3.quest.commands {
	import me.pa3.quest.events.HandleUserActionEvent;
	import me.pa3.quest.services.IActionsHandlerService;

	import org.robotlegs.mvcs.StarlingCommand;

	public class HandleUserActionCommand extends StarlingCommand {

		[Inject]
		public var event:HandleUserActionEvent;

		[Inject]
		public var actionsService:IActionsHandlerService;

		override public function execute():void {
			actionsService.handleAction(event., event.destinationActor, event.action, event.touchPoint);
		}
	}
}
