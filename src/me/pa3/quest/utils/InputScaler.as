package me.pa3.quest.utils {
	import flash.geom.Point;

	/**
	 * Object which translate screen coordinates (e.g. game screen size could be 400x300) to game internal coordinates (i.e. 100x100).
	 */
	public class InputScaler {

		private var windowSize:Point;
		private var worldSize:Point;

		public function InputScaler(windowSize:Point, worldSize:Point) {
			this.windowSize = windowSize;
			this.worldSize = worldSize;
		}

		public function worldToView(input:Point):Point {
			return new Point(input.x*windowSize.x/worldSize.x, input.y*windowSize.y/worldSize.y);
		}

		public function viewToWorld(input:Point):Point {
			return new Point(input.x*worldSize.x/windowSize.x, input.y*worldSize.y/windowSize.y);
		}

		public function setWindowSize(windowSize:Point):void {
			this.windowSize = windowSize;
		}

		public function setWorldSize(worldSize:Point):void {
			this.worldSize = worldSize;
		}

		public function get viewToWorldScale():Point {
			return new Point(worldSize.x/windowSize.x, worldSize.y/windowSize.y);
		}

		public function get worldToViewScale():Point {
			return new Point(windowSize.x/worldSize.x, windowSize.y/worldSize.y);
		}
	}
}
