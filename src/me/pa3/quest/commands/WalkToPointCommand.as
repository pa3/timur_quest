package me.pa3.quest.commands {
	import flash.geom.Point;

	import me.pa3.quest.events.WalkToPointEvent;
import me.pa3.quest.events.WalkThePathEvent;
import me.pa3.quest.models.WalkMapModel;
	import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.vos.Path;

import org.robotlegs.mvcs.StarlingCommand;

	public class WalkToPointCommand extends StarlingCommand{

		[Inject]
		public var inputScaler:InputScaler;

		[Inject]
		public var walkMapModel:WalkMapModel;

		[Inject]
		public var event:WalkToPointEvent;

		override public function execute():void {
//			var worldSourcePoint:Point = inputScaler.viewToWorld(event.currentPosition);
//			var worldDestinationPoint:Point = inputScaler.viewToWorld(event.destination);
//			var path:Path = walkMapModel.findPath(worldSourcePoint, worldDestinationPoint);

			var path:Path = walkMapModel.findPath(event.currentPosition, event.destination);

            dispatch(new WalkThePathEvent(event.actorId, path));
		}
	}
}
