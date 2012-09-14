package me.pa3.quest.utils {
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class TwoKeysMapTest {

		private var map:TwoKeysMap;

		[Before]
		public function setUp():void {
			map = new TwoKeysMap();
			map.put(1, 2, true);
		}

		[Test]
		public function shouldStoreValueByTwoKeysOfTheSameType():void {
			assertTrue(map.contains(1, 2));
		}

		[Test]
		public function shouldStoreValueByTwoKeysOfDifferentTypes():void {
			map = new TwoKeysMap();
			map.put("1", 1.0, new Date());
			map.put("2", 2.0, new Date());
			assertTrue(map.contains("1", 1.0));
			assertTrue(map.contains("2", 2.0));
		}

		[Test]
		public function shouldDistinguishKey1Key2FromKey2Key1():void {
			assertFalse(map.contains(2, 1));
		}

		[Test]
		public function shouldBeAbleToRemoveMappings():void {
			map.remove(1, 2);
			assertFalse(map.contains(1, 2));
		}

		[Test]
		public function shouldRemoveNonexistentMappingWithoutException():void {
			map.remove(123, 124);
		}

		[Test]
		public function shouldReturnValueByKeys():void {
			assertTrue(map.get(1, 2));
		}

		[Test]
		public function shouldReturnNullForNonexistentMapping():void {
			assertNull(map.get(12, 2));
		}
	}
}

