package me.pa3.quest.commands {
	import me.pa3.quest.events.NotifyAboutWalkFinishedEvent;
	import me.pa3.quest.models.ActorsModel;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.StarlingCommand;

	public class NotifyAboutWalkFinishedCommand extends StarlingCommand{

		[Inject]
		public var event:NotifyAboutWalkFinishedEvent;

		[Inject]
		public var actorsModel:ActorsModel;

		override public function execute():void {
			actorsModel.setActorPosition();
		}
	}
}
