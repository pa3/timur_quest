package me.pa3.quest.views {

	import me.pa3.quest.utils.Globals;

	import starling.display.DisplayObject;
	import starling.display.Sprite;

	public class GamePlayView extends Sprite {

		private var _currentLocation:LocationView;

		public function showLocation(background:DisplayObject, actors:Vector.<ActorView>):void {
			if (_currentLocation && contains(_currentLocation)) {
				removeChild(_currentLocation);
			}
			var locationView:LocationView = new LocationView(background, actors);
			locationView.scaleX = Globals.SCALE_X;
			locationView.scaleY = Globals.SCALE_Y;
			addChild(locationView);
		}

	}
}
