package me.pa3.quest.utils {
	import flash.geom.Point;

	import me.pa3.quest.vos.Gate;

	public class VerticalGate extends Gate {
		public function VerticalGate(topPoint:Point, bottomPoint:Point) {
			super(topPoint, bottomPoint);
		}

		override public function getMiddlePointToPassGates(startPoint:Point, endPoint:Point):Point {
			var resultY:Number = 0.0;
			if (startPoint.x == endPoint.x || startPoint.y == endPoint.y) {
				resultY = endPoint.y;
			} else {
				var lineK:Number = (startPoint.y - endPoint.y)/(startPoint.x - endPoint.x);
				var lineB:Number = (endPoint.y*startPoint.x - startPoint.y*endPoint.x)/(startPoint.x - endPoint.x);
				resultY = lineK*point1.x + lineB;
			}

			if (resultY > point2.y) {
				return point2.clone();
			} else if (resultY < point1.y) {
				return point1.clone();
			} else {
				return new Point(point1.x, resultY);
			}
		}
	}
}
