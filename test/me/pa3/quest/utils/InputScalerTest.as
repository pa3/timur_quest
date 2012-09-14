package me.pa3.quest.utils {
	import flash.geom.Point;

	import org.flexunit.asserts.assertEquals;

	public class InputScalerTest {

		private var sut:InputScaler;

		[Before]
		public function setUp():void {
			sut = new InputScaler(new Point(10, 10), new Point(20, 20));
		}

		[Test]
		public function shouldConvertWorldToWindowCoords():void {
			assertPointsEquals(new Point(10, 1), sut.worldToView(new Point(20, 2)));
		}

		[Test]
		public function shouldConvertWindowToWorldCoords():void {
			assertPointsEquals(new Point(40, 4), sut.viewToWorld(new Point(20, 2)));
		}

		[Test]
		public function shouldUpdateWindowSize():void {
			sut.setWindowSize(new Point(20, 20));
			assertPointsEquals(new Point(10, 1), sut.viewToWorld(new Point(10, 1)));
		}

		[Test]
		public function shouldUpdateWorldSize():void {
			sut.setWorldSize(new Point(40, 40));
			assertPointsEquals(new Point(10, 1), sut.worldToView(new Point(40, 4)));
		}

		[Test]
		public function shouldCalculateWorldToViewScale():void {
			assertPointsEquals(new Point(2.0, 2.0), sut.viewToWorldScale);
		}

		[Test]
		public function shouldCalculateViewToWorldScale():void {
			assertPointsEquals(new Point(0.5, 0.5), sut.worldToViewScale);
		}

		private function assertPointsEquals(point1:Point, point2:Point):void {
			assertEquals(point1.x,  point2.x);
			assertEquals(point1.y,  point2.y);
		}
	}
}
