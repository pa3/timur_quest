package me.pa3.quest.events {
	import flash.events.Event;
	import flash.geom.Point;

	public class NotifyAboutWalkFinishedEvent extends Event {
		public static const EVENT_TYPE:String = "NotifyAboutWalkFinishedEvent";
		private var _actorId:String;
		private var _currentPosition:Point;

		public function NotifyAboutWalkFinishedEvent(event:WalkFinishedViewEvent) {
			_actorId = event.actorId;
			_currentPosition = event.currentPosition;
			super(EVENT_TYPE);
		}

		public function get actorId():String {
			return _actorId;
		}

		public function get currentPosition():Point {
			return _currentPosition;
		}
	}
}
