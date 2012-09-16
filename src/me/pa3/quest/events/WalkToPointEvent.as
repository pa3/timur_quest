package me.pa3.quest.events {
	import flash.events.Event;
	import flash.geom.Point;

	public class WalkToPointEvent extends Event{

		public static const EVENT_TYPE:String = "WalkToPointEvent";
        private var _destination:Point;
        private var _currentPosition:Point;
        private var _actorId:String;

		public function WalkToPointEvent(actorId:String, currentPosition:Point, destination:Point) {
			super(EVENT_TYPE);
            _actorId = actorId;
            _currentPosition = currentPosition;
            _destination = destination;
		}


        public function get actorId():String {
            return _actorId;
        }

        public function get destination():Point {
            return _destination;
        }

        public function get currentPosition():Point {
            return _currentPosition;
        }
    }
}
