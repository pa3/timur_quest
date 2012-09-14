package me.pa3.quest.commands {
	import flash.geom.Point;

	import me.pa3.quest.events.GoToPointEvent;
	import me.pa3.quest.models.WalkMapModel;
	import me.pa3.quest.utils.InputScaler;

	import org.robotlegs.mvcs.StarlingCommand;

	public class GoToPointCommand extends StarlingCommand{

		[Inject]
		public var inputScaler:InputScaler;

		[Inject]
		public var walkMapModel:WalkMapModel;

		[Inject]
		public var event:GoToPointEvent;

		override public function execute():void {
			var worldPoint:Point = inputScaler.viewToWorld(event.point);
			walkMapModel.findPath()
		}
	}
}
