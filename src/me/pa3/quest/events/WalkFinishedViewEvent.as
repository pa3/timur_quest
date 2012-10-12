package me.pa3.quest.events {
	import flash.geom.Point;

	import starling.events.Event;

	public class WalkFinishedViewEvent extends Event {
		public static const EVENT_TYPE:String = "WalkFinishedViewEvent";
		private var _actorId:String;
		private var _currentPosition:Point;

		public function WalkFinishedViewEvent(actorId:String, currentPosition:Point) {
			super(EVENT_TYPE);
			_actorId = actorId;
			_currentPosition = currentPosition;
		}

		public function get actorId():String {
			return _actorId;
		}

		public function get currentPosition():Point {
			return _currentPosition;
		}
	}
}
