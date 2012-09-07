package me.pa3.quest.models {
	import flash.display.DisplayObject;

	import org.robotlegs.mvcs.Actor;

	public class BackgroundModel extends Actor {

		[Embed(source = "/locations/backgrounds/location1.jpg")]
		private static const LOCATION1_BACKGROUND:Class;

		public function getBackgroundById(backgroundId:String):DisplayObject {
			return new LOCATION1_BACKGROUND();
		}
	}
}
