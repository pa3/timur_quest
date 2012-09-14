package me.pa3.quest.utils {
	import flash.utils.Dictionary;

	public class TwoKeysMap {

		private var _data:Dictionary = new Dictionary();


		public function put(key1:*, key2:*, value:*):void {
			if (!_data[key1]) {
				_data[key1] = new Dictionary();
			}
			_data[key1][key2] = value;

		}

		public function get(key1:*, key2:*):* {
			if (_data[key1]) {
				return _data[key1][key2];
			} else {
				return null;
			}
		}

		public function contains(key1:*, key2:*):Boolean {
			if (!_data[key1]) {
				return false;
			} else {
				return _data[key1][key2] != null;
			}
		}

		public function remove(key1:*, key2:*):* {
			var result:* = null;
			if (_data[key1]) {
				result = _data[key1][key2];
				delete _data[key1][key2];
				if (isEmpty(_data[key1])) {
					delete _data[key1];
				}
			}
			return result;
		}

		private function isEmpty(dictionary:Dictionary):Boolean {
			var count:int = 0;
			for (var key:Object in dictionary) {
			   count++;
			}
			return count == 0;
		}
	}
}
