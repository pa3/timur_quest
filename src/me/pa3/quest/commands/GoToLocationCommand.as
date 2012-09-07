package me.pa3.quest.commands {
	import flash.display.DisplayObject;

	import me.pa3.quest.events.GoToLocationEvent;
	import me.pa3.quest.events.ShowLocationEvent;
	import me.pa3.quest.models.BackgroundModel;

	import org.robotlegs.mvcs.Command;

	public class GoToLocationCommand extends Command {

		[Inject]
		public var event:GoToLocationEvent;

		[Inject]
		public var backgroundModel:BackgroundModel;

		override public function execute():void {
			var background:DisplayObject = backgroundModel.getBackgroundById(event.location.backgroundId);
			dispatch(new ShowLocationEvent(background));
		}
	}
}
