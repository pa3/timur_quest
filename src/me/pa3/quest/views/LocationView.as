package me.pa3.quest.views {
import de.polygonal.ds.HashMap;

import flash.geom.Point;

	import me.pa3.quest.events.LocationClickedEvent;
	import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.views.ActorView;

import starling.core.Starling;
import starling.display.DisplayObject;

import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class LocationView extends Sprite {

		private var _background:DisplayObject;
		private var _actors:Vector.<ActorView>;
        private var _actorsById:HashMap;

		public function LocationView(background:DisplayObject, actors:Vector.<ActorView>) {
			_background = background;
            _actors = actors;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void {
			addChild(_background);
            _actorsById = new HashMap();
			for each (var anActor:ActorView in _actors) {
				anActor.touchable = false;
				addChild(anActor);
                _actorsById.set(anActor.id, anActor);
			}
            addChild(new DebugView());
			_background.addEventListener(TouchEvent.TOUCH, onTouch);

		}


        public function getActorPosition(actorId:String):Point {
            var actor:ActorView = ActorView(_actorsById.get(actorId));
            return new Point(actor.x, actor.y);
        }

        private function onTouch(event:TouchEvent):void {
			var touch:Touch = event.getTouch(this);
			if (touch && touch.phase == TouchPhase.BEGAN) {
                var touchPoint:Point = new Point(touch.globalX, touch.globalY);
                globalToLocal(touchPoint, touchPoint);
				dispatchEvent(new LocationClickedEvent(touchPoint));
			}
		}
	}
}
