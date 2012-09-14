package me.pa3.quest.events {
	import flash.events.Event;
	import flash.geom.Point;

	public class GoToPointEvent extends Event{

		public static const EVENT_TYPE:String = "GoToPointEvent";
		private var _point:Point;

		public function GoToPointEvent(point:Point) {
			super(EVENT_TYPE);
			_point = point;
		}

		public function get point():Point {
			return _point;
		}
	}
}
