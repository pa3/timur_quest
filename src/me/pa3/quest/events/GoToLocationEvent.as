package me.pa3.quest.events {
	import flash.events.Event;

	import me.pa3.quest.vos.Location;

	public class GoToLocationEvent extends Event {
		public static const EVENT_TYPE:String = "GoToLocationEvent.EVENT_TYPE";

		private var _location:Location;
		public function GoToLocationEvent(location:Location) {
			super(EVENT_TYPE);
			_location = location;
		}

		public function get location():Location {
			return _location;
		}
	}
}
