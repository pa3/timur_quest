package me.pa3.quest.vos {
	import flash.geom.Point;

	public class Path {
		private var _waypoints:Vector.<Point>;
		private var _currentPoint:int;

		public function Path(points:Vector.<Point>) {
			_waypoints = points.concat();
			_currentPoint = -1;
		}

		public function hasMorePoints():Boolean {
			return _currentPoint < _waypoints.length - 1;
		}

		public function getNextPoint():Point {
			if (++_currentPoint > _waypoints.length) {
				return null;
			} else {
				return _waypoints[_currentPoint];
			}
		}


	}

}
