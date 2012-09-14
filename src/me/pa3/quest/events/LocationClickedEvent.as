package me.pa3.quest.events {

	import flash.geom.Point;

	import starling.events.Event;

	public class LocationClickedEvent extends Event {
		public static const EVENT_TYPE:String = "LocationClickedEvent";
		private var _point:Point;

		public function LocationClickedEvent(point:Point) {
			super(EVENT_TYPE);
			_point = point;
		}

		public function get point():Point {
			return _point;
		}
	}
}
