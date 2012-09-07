package me.pa3.quest.vos {
	public class Location {
		private var _backgroundId:String;

		public function Location(backgroundId:String) {
			_backgroundId = backgroundId;
		}

		public function get backgroundId():String {
			return _backgroundId;
		}
	}
}
