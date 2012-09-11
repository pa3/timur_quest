package me.pa3.quest.events {
	import flash.events.Event;

	public class WalkThePathEvent extends Event {
		public static const COMPLETE:String = "WalkThePathEvent.COMPLETE";

		public function WalkThePathEvent(type:String) {
			super(type);
		}
	}
}
