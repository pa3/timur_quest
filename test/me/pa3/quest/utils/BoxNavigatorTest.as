package me.pa3.quest.utils {
	import me.pa3.quest.vos.Box;
	import me.pa3.quest.vos.BoxVertex;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	/*
	 *
	 * For all of the tests here we have a following walk-map:
	 *
	 *    +----+    +----+
	 *    | b1 |    | b2 |
	 *    +----+    +----+---------+----+
	 *              |      b3      | b4 |
	 *              +----+----+----+----+
	 *                   |    |    | b6 |
	 *                   | b5 +----+----+
	 *                   |    | b7 | b8 |
	 *                   +----+----+----+
	 */

	public class BoxNavigatorTest {
		private var b1:Box;
		private var b2:Box;
		private var b3:Box;
		private var b4:Box;
		private var b5:Box;
		private var b6:Box;
		private var b7:Box;
		private var b8:Box;
		private var map:BoxNavigator;

		[Test]
		public function shouldHaveNoRouteBetweenB1andB2():void {
			assertFalse(map.haveRoute(b1, b2));
		}

		[Test]
		public function shouldHaveRouteBetweenB2andB3():void {
			assertTrue(map.haveRoute(b2, b3));
		}

		[Test]
		public function shouldHaveRouteBetweenB2andB5():void {
			assertTrue(map.haveRoute(b2, b5));
		}

		[Test]
		public function shouldReturnB3AsNextStepInRouteFromB2ToB8():void {
			assertEquals(b3, map.nextBoxInRoute(b2, b8));
		}

		[Before]
		public function setUp():void {
			b1 = new Box(new BoxVertex(0, 0), new BoxVertex(10, 0), new BoxVertex(10, 10), new BoxVertex(0, 10), null, 1, "box1");
			b2 = new Box(new BoxVertex(20, 0), new BoxVertex(30, 0), new BoxVertex(30, 10), new BoxVertex(20, 10), null, 1, "box2");
			b3 = new Box(new BoxVertex(20, 10), new BoxVertex(50, 10), new BoxVertex(50, 20), new BoxVertex(20, 20), null, 1, "box3");
			b4 = new Box(new BoxVertex(50, 10), new BoxVertex(60, 10), new BoxVertex(60, 20), new BoxVertex(50, 20), null, 1, "box4");
			b5 = new Box(new BoxVertex(30, 20), new BoxVertex(40, 20), new BoxVertex(40, 40), new BoxVertex(30, 40), null, 1, "box5");
			b6 = new Box(new BoxVertex(50, 20), new BoxVertex(60, 20), new BoxVertex(60, 30), new BoxVertex(50, 30), null, 1, "box6");
			b7 = new Box(new BoxVertex(40, 30), new BoxVertex(50, 30), new BoxVertex(50, 40), new BoxVertex(40, 40), null, 1, "box7");
			b8 = new Box(new BoxVertex(50, 30), new BoxVertex(60, 30), new BoxVertex(60, 40), new BoxVertex(50, 40), null, 1, "box8");
			map = new BoxNavigator(Vector.<Box>([b1, b2, b3, b4, b5, b6, b7, b8]));
		}

	}

}
