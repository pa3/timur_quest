package me.pa3.quest.vos {
	import flash.geom.Point;

	public class ActorInfo {
		private var _id:String;
		private var _position:Point;

		public function ActorInfo(actorId:String, actorPosition:Point) {
			_id = actorId;
			_position = actorPosition;
		}

		public function get id():String {
			return _id;
		}

		public function get position():Point {
			return _position;
		}
	}
}
