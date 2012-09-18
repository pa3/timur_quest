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

		private var _backgroundLayers:Vector.<DisplayObject>;
		private var _actors:Vector.<ActorView>;
        private var _actorsById:HashMap;

		public function LocationView(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>) {
            _backgroundLayers = backgroundLayers;
            _actors = actors;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void {
            for each (var layer:DisplayObject in _backgroundLayers) {
                addChild(layer);
            }
            _actorsById = new HashMap();
			for each (var anActor:ActorView in _actors) {
				anActor.touchable = false;
				addChild(anActor);
                _actorsById.set(anActor.id, anActor);
			}
            addChild(new DebugView());
            // TODO: Если слои перестанут быть размером во весь экран - надо будет переделать.
			_backgroundLayers[_backgroundLayers.length-1].addEventListener(TouchEvent.TOUCH, onTouch);
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
