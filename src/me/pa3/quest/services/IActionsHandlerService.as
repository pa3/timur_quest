package me.pa3.quest.services {
	import flash.geom.Point;

	import me.pa3.quest.views.ActorView;

	import me.pa3.quest.vos.Action;
	import me.pa3.quest.vos.ActorInfo;

	public interface IActionsHandlerService {

		function handleAction(sourceActor:ActorInfo, destinationActor:ActorInfo, action:Action, touchPoint:Point):void;
	}
}
