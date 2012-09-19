package me.pa3.quest.views {

	import me.pa3.quest.utils.InputScaler;
	import me.pa3.quest.vos.Box;

	import starling.display.DisplayObject;
	import starling.display.Sprite;

	public class GamePlayView extends Sprite {

		[Inject]
		public var inputScaler:InputScaler;

		private var _currentLocation:LocationView;

		public function showLocation(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>, walkBoxes:Vector.<Box>):void {
			if (_currentLocation && contains(_currentLocation)) {
				removeChild(_currentLocation);
			}
			var locationView:LocationView = new LocationView(backgroundLayers, actors, walkBoxes);
			locationView.scaleX = inputScaler.worldToViewScale.x;
			locationView.scaleY = inputScaler.worldToViewScale.y;
			addChild(locationView);
		}

	}
}
