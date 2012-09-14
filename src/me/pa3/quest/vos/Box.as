package me.pa3.quest.vos {
	import flash.geom.Point;

	public class Box {

		private var _vertexes:Vector.<BoxVertex> = new Vector.<BoxVertex>();
		private var _upperRightIndex:int;
		private var _lowerLeftIndex:int;
		private var _lowerRightIndex:int;
		private var _upperLeftIndex:int;

		private var _scaleSlot:ScaleSlot;
		private var _zOrder:int;

		private var _debugName:String;

		public function Box(vertex1Position:BoxVertex, vertex2Position:BoxVertex, vertex3Position:BoxVertex, vertex4Position:BoxVertex, scaleSlot:ScaleSlot, zOrder:int,
							debugName:String = null) {
			_debugName = debugName;
			_zOrder = zOrder;
			_scaleSlot = scaleSlot;

			_upperLeftIndex = 0;
			_upperRightIndex = 0;
			_lowerLeftIndex = 0;
			_lowerRightIndex = 0;

			_vertexes[0] = vertex1Position;
			_vertexes[1] = vertex2Position;
			_vertexes[2] = vertex3Position;
			_vertexes[3] = vertex4Position;

			_vertexes.sort(function (v1:BoxVertex, v2:BoxVertex):Number {
				return v1.y - v2.y;
			});

			_upperLeftIndex = _vertexes[0].x > _vertexes[1].x ? 1 : 0;
			_upperRightIndex = _vertexes[0].x > _vertexes[1].x ? 0 : 1;
			_lowerLeftIndex = _vertexes[2].x > _vertexes[3].x ? 3 : 2;
			_lowerRightIndex = _vertexes[2].x > _vertexes[3].x ? 2 : 3;
		}

		public function get ur():BoxVertex {
			return _vertexes[_upperRightIndex];
		}

		public function get ll():BoxVertex {
			return _vertexes[_lowerLeftIndex];
		}

		public function get lr():BoxVertex {
			return _vertexes[_lowerRightIndex];
		}

		public function get ul():BoxVertex {
			return _vertexes[_upperLeftIndex];
		}

		public function get vertexes():Vector.<BoxVertex> {
			return _vertexes;
		}

		public function get clockwiseSortedVertexes():Vector.<BoxVertex> {
			var result:Vector.<BoxVertex> = _vertexes.concat();
			var centerPoint:BoxVertex = new BoxVertex(0, 0);

			for each (var aVertex:BoxVertex in result) {
				centerPoint.add(aVertex);
			}
			centerPoint.setTo(centerPoint.x/result.length, centerPoint.y/length);

			result.sort(function (v1:BoxVertex, v2:BoxVertex):Number {
				return ((v1.x - centerPoint.x)*(v2.y - centerPoint.y) - (v2.x - centerPoint.x)*(v1.y - centerPoint.y));
			});
			return result;
		}

		public function getNearestPoint(target:Point):Point {

			if (isPointInside(target)) {
				return target;
			}

			var result:Vector.<ClosestPointOnLineSegment> = new Vector.<ClosestPointOnLineSegment>(4);
			result[0] = distanceToLineSegment(ul, ur, target);
			result[1] = distanceToLineSegment(ur, lr, target);
			result[2] = distanceToLineSegment(lr, ll, target);
			result[3] = distanceToLineSegment(ul, ll, target);

			result.sort(function (c1:ClosestPointOnLineSegment, c2:ClosestPointOnLineSegment):Number {
				return (c1.distanceToPoint - c2.distanceToPoint)
			});

			return result[0].pointInBox;
		}

		public function isPointInside(point:Point):Boolean {
			var result:Boolean = false;
			for (var i:int = 0, j:int = _vertexes.length - 1; i < _vertexes.length; j = i++) {
				if ((((_vertexes[i].y <= point.y) && (point.y < _vertexes[j].y)) ||
						((_vertexes[j].y <= point.y) && (point.y < _vertexes[i].y))) &&
						(point.x < (_vertexes[j].x - _vertexes[i].x)*(point.y - _vertexes[i].y)/(_vertexes[j].y - _vertexes[i].y) + _vertexes[i].x)) {
					result = !result;
				}
			}
			return result;
		}

		private function distanceToLineSegment(v1:BoxVertex, v2:BoxVertex, p:Point):ClosestPointOnLineSegment {
			var lineSegmentLength:Number = v1.subtract(v2).length;
			if (lineSegmentLength < 0) {
				return new ClosestPointOnLineSegment(p.subtract(v2).length, v1);
			}

			var t:Number = dot(p.subtract(v1), v2.subtract(v1))/(lineSegmentLength*lineSegmentLength);

			if (t < 0) {
				return new ClosestPointOnLineSegment(p.subtract(v1).length, v1);
			} else if (t > 1) {
				return new ClosestPointOnLineSegment(p.subtract(v2).length, v2);
			}

			var projection:Point = new Point((v1.x + t*(v2.x - v1.x)), (v1.y + t*(v2.y - v1.y)));
			return new ClosestPointOnLineSegment(p.subtract(projection).length, projection);
		}

		private function dot(point1:Point, point2:Point):Number {
			return point1.x*point2.x + point1.y*point2.y;
		}

		public function getScaleAt(point:Point):Number {
			return _scaleSlot.getScaleAt(point.y);
		}

		public function get scaleSlot():ScaleSlot {
			return _scaleSlot;
		}

		public function get zOrder():int {
			return _zOrder;
		}

		public function toString():String {
			if (_debugName) {
				return _debugName;
			} else {
				return super.toString();
			}
		}

		public function getVertexUnderPoint(point:Point):BoxVertex {
			for each (var aVertex:BoxVertex in _vertexes) {
				if (aVertex.isUnderPoint(point)) {
					return aVertex;
				}
			}
			return null;
		}

	}
}

import flash.geom.Point;

class ClosestPointOnLineSegment {
	public var distanceToPoint:Number;
	public var pointInBox:Point;

	public function ClosestPointOnLineSegment(distanceToPoint:Number, pointInBox:Point) {
		this.distanceToPoint = distanceToPoint;
		this.pointInBox = pointInBox;
	}
}

