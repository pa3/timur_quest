package me.pa3.quest.services {
	import flash.geom.Point;

	import me.pa3.quest.events.WalkToPointEvent;
	import me.pa3.quest.vos.Action;
	import me.pa3.quest.vos.ActorInfo;

	import org.robotlegs.mvcs.Actor;

	public class ActionsHandlerService extends Actor implements IActionsHandlerService {

		public function handleAction(sourceActor:ActorInfo, destinationActor:ActorInfo, action:Action, touchPoint:Point):void {
			if (destinationActor == null) {
				dispatch(new WalkToPointEvent(sourceActor.id, sourceActor.position, touchPoint));
			}
		}
	}
}
