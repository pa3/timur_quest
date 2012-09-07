package me.pa3.quest.views {
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class GamePlayView extends Sprite{

		private var _currentLocation:LocationView;

		public function showLocation(background:DisplayObject):void {
			if (_currentLocation && contains(_currentLocation)) {
				removeChild(_currentLocation);
			}
			addChild(new LocationView(background));
		}

	}
}
