package me.pa3.quest.views {
	import flash.geom.Point;

	import me.pa3.quest.events.LocationClickedEvent;
	import me.pa3.quest.utils.InputScaler;

	import starling.core.Starling;

	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class LocationView extends Sprite {

		private var _background:DisplayObject;
		private var _actors:Vector.<DisplayObject>;

		public function LocationView(background:DisplayObject, actors:Vector.<DisplayObject>) {
			_background = background;
			_actors = actors;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void {
			addChild(_background);
			for each (var anActor:DisplayObject in _actors) {
				anActor.touchable = false;
				addChild(anActor);
			}
			_background.addEventListener(TouchEvent.TOUCH, onTouch);
		}

		private function onTouch(event:TouchEvent):void {
			var touch:Touch = event.getTouch(this);
			if (touch.phase == TouchPhase.BEGAN) {
				dispatchEvent(new LocationClickedEvent(new Point(touch.globalX, touch.globalY)));
			}
		}
	}
}
