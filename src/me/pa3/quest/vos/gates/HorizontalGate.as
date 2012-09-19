package me.pa3.quest.vos.gates {
	import flash.geom.Point;

	public class HorizontalGate extends Gate {
		public function HorizontalGate(leftPoint:Point, rightPoint:Point) {
			super(leftPoint, rightPoint);
		}

		override public function getMiddlePointToPassGates(startPoint:Point, endPoint:Point):Point {
			var resultX:Number = 0;
			if (startPoint.x == endPoint.x || startPoint.y == endPoint.y) {
				resultX = endPoint.x;
			} else {
				var lineK:Number = (startPoint.y - endPoint.y)/(startPoint.x - endPoint.x);
				var lineB:Number = (endPoint.y*startPoint.x - startPoint.y*endPoint.x)/(startPoint.x - endPoint.x);
				resultX = (point1.y/lineK - lineB/lineK);
			}

			if (resultX > point2.x) {
				return point2.clone();
			} else if (resultX < point1.x) {
				return point1.clone();
			} else {
				return new Point(resultX, point1.y);
			}
		}
	}
}
