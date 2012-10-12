package me.pa3.quest.events {
	import flash.events.Event;
	import flash.geom.Point;

	import me.pa3.quest.vos.Action;
	import me.pa3.quest.vos.ActorInfo;

	public class HandleUserActionEvent extends Event {
		public static const EVENT_TYPE:String = "HandleUserActionEvent";
		private var _destinationActor:ActorInfo;
		private var _action:Action;
		private var _touchPoint:Point;

		public function HandleUserActionEvent(event:UserPerformedGestureEvent) {
			super(EVENT_TYPE);
			_destinationActor = new ActorInfo(event.actor.id, event.actor.position);
			_action = event.action;
			_touchPoint = event.touchPoint;
		}

		public function get destinationActor():ActorInfo {
			return _destinationActor;
		}

		public function get action():Action {
			return _action;
		}

		public function get touchPoint():Point {
			return _touchPoint;
		}
	}
}
