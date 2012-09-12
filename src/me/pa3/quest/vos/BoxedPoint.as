package me.pa3.quest.vos {
	import flash.geom.Point;

	public class BoxedPoint {
		private var _point:Point;
		private var _box:Box;

		public function BoxedPoint(point:Point, box:Box) {
			_point = point;
			_box = box;
		}

		public function get point():Point {
			return _point;
		}

		public function set point(value:Point):void {
			_point = value;
		}

		public function get box():Box {
			return _box;
		}

		public function set box(value:Box):void {
			_box = value;
		}
	}
}
