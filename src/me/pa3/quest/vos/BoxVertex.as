package me.pa3.quest.vos {
	import flash.geom.Point;

	/**
	 * The BoxVertex class represents a vertex of the Box.
	 * It is just an subclass of the Vector2f class with some new functionality added.
	 */
	public class BoxVertex extends Point {

		private var _selected:Boolean = false;
		private var _selectionRadiusSquared:Number = 25;

		public function BoxVertex(x:Number, y:Number) {
			super(x, y);
		}

		/**
		 * Sets radius in pixels of the area near the current vertex, click in which causes selection of the vertex
		 * @param radius radius in pixels. Default value is 5.
		 */
		public function setSelectionRadius(radius:Number):void {
			_selectionRadiusSquared = radius*radius;
		}

		/*
		 * Checks whether current veretex is under given point
		 */
		public function isUnderPoint(point:Point):Boolean {
			return this.subtract(point).length < _selectionRadiusSquared;
		}

		public function get selected():Boolean {
			return _selected;
		}

		public function set selected(selected:Boolean):void {
			_selected = selected;
		}

	}
}
