package me.pa3.quest.views {
import de.polygonal.ds.HashMap;

import flash.geom.Point;

import me.pa3.quest.events.LocationClickedEvent;
import me.pa3.quest.utils.BoxNavigator;
import me.pa3.quest.utils.BoxUtils;
import me.pa3.quest.vos.Box;
import me.pa3.quest.vos.BoxedPoint;

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
    private var _walkBoxes:Vector.<Box>;

    public function LocationView(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>, walkBoxes:Vector.<Box>) {
        _backgroundLayers = backgroundLayers;
        _actors = actors;
        _walkBoxes = walkBoxes;
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
        _backgroundLayers[_backgroundLayers.length - 1].addEventListener(TouchEvent.TOUCH, onTouch);

        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame():void {
        var point:Point = new Point();
        for each (var actor:ActorView in _actors) {
            point.setTo(actor.x, actor.y);
            var actorsBox:BoxedPoint =  BoxUtils.placePointInBox(point, _walkBoxes);
        }
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
