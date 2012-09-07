package me.pa3.quest.events {
	import flash.display.DisplayObject;
	import flash.events.Event;

	public class ShowLocationEvent extends Event {

		public static const EVENT_TYPE:String = "ShowLocationEvent";
		private var _background:DisplayObject;

		public function ShowLocationEvent(background:DisplayObject) {
			super(EVENT_TYPE);
			_background = background;
		}

		public function get background():DisplayObject {
			return _background;
		}
	}
}
