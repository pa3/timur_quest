package me.pa3.quest.vos {
	import flash.geom.Point;

	public class Gate {
		private var _point1:Point;
		private var _point2:Point;

		public function Gate(point1:Point, point2:Point) {
			_point1 = point1;
			_point2 = point2;
		}

		public function get point1():Point {
			return _point1;
		}

		public function get point2():Point {
			return _point2;
		}

		public function getMiddlePointToPassGates(startPoint:Point, endPoint:Point):Point {
			throw new Error("Unsupported operation!");
		}
	}
}
