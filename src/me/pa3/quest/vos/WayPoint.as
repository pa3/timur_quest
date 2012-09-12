package me.pa3.quest.vos {
	import flash.geom.Point;

	public class WayPoint {
		private var _point:Point;
		private var _scale:Number;

		public function WayPoint(point:Point, scale:Number) {
			_point = point;
			_scale = scale;
		}

		public function get point():Point {
			return _point;
		}

		public function set point(value:Point):void {
			_point = value;
		}

		public function get scale():Number {
			return _scale;
		}

		public function set scale(value:Number):void {
			_scale = value;
		}
	}
}
