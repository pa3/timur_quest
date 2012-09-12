package me.pa3.quest.models {
	import flash.geom.Point;

	import me.pa3.quest.vos.Box;
	import me.pa3.quest.vos.BoxedPoint;
	import me.pa3.quest.vos.Gate;
	import me.pa3.quest.vos.Path;
	import me.pa3.quest.vos.Path;
	import me.pa3.quest.vos.WayPoint;

	import org.robotlegs.mvcs.Actor;

	public class WalkMapModel extends Actor {
		private var _boxes:Vector.<Box>;
		private var _navigator:BoxNavigator;

		private function findPath(startPoint:Point, endPoint:Point):Path {

			var startPointPlacedInBox:BoxedPoint = placePointInBox(startPoint);
			var startBox:Box = startPointPlacedInBox.box;
			var startPoint:Point = startPointPlacedInBox.point;

			var endPointPlacedInBox:BoxedPoint = placePointInBox(endPoint);
			var endBox:Box = endPointPlacedInBox.box;
			var endPoint:Point = endPointPlacedInBox.point;

			if (startBox == endBox) {
				return createPath(Vector.<BoxedPoint>([startPointPlacedInBox, endPointPlacedInBox]));
			}

			var result:Vector.<BoxedPoint> = new Vector.<BoxedPoint>();
			var passedGates:Vector.<Gate> =  new Vector.<Gate>();

			result.push(startPointPlacedInBox);

			var prevBox:Box = startBox;
			var currentBox:Box = startBox;
			var prevPoint:Point = startPoint;
			while (currentBox != endBox) {
				currentBox = _navigator.nextBoxInRoute(prevBox, endBox);
				if (currentBox == null) {
					break;
				}

				var	gate:Gate = _navigator.getGateBetween(prevBox, currentBox);
				if (gate == null) {
					break;
				}

				var	gatePassPoint:Point = gate.getMiddlePointToPassGates(prevPoint, endPoint);
				passedGates.push(gate);
				result.push(new BoxedPoint(gatePassPoint, currentBox));
				prevPoint = gatePassPoint;
				prevBox = currentBox;
			}

			result.push(new BoxedPoint(endPoint, endBox));

			if (result.length < 4) {
				return createPath(result);
			}
			return createSmoothPath(result, passedGates);
		}

		private function createSmoothPath(result:Vector.<BoxedPoint>, passedGates:Vector.<Gate>):Path {
			var smoothedResult:Vector.<BoxedPoint> = new Vector.<BoxedPoint>();

			smoothedResult.push(result[0]);
			for (var i:int = 2; i < result.length; i++) {
				smoothedResult.push(new BoxedPoint(passedGates[i - 2].getMiddlePointToPassGates(result[i - 2].point, result[i].point), result[i].box));
			}
			smoothedResult.push(result[result.length - 1]);

			for (i = 1; i < smoothedResult.length; i++) {
				if (smoothedResult[i].point.subtract(smoothedResult[i - 1].point).length < 1) {
					smoothedResult.splice(i, 1);
					i--;
				}
			}

			return createPath(smoothedResult);
		}

		private function createPath(points:Vector.<BoxedPoint>):Path {
			var wayPoints:Vector.<WayPoint> = new Vector.<WayPoint>();
			for each (var aPoint:BoxedPoint in points) {
				wayPoints.push(new WayPoint(aPoint.point, aPoint.box.getScaleAt(aPoint.point));
			}
			return new Path(wayPoints);
		}

		private function placePointInBox(inputPoint:Point):BoxedPoint {
			var resultPoint:Point = inputPoint;
			var resultBox:Box = null;
			var destToResultBox:Number = Number.MAX_VALUE;
			for each (var aBox:Box in _boxes) {
				var nearestPoint:Point = aBox.getNearestPoint(inputPoint);
				var dest:Number = nearestPoint.subtract(inputPoint).length;
				if (dest < destToResultBox) {
					resultBox = aBox;
					destToResultBox = dest;
					resultPoint = nearestPoint;
				}
			}
			return new BoxedPoint(resultPoint.clone(), resultBox);
		}

	}


}


