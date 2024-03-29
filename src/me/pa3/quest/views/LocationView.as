package me.pa3.quest.views {
import de.polygonal.ds.HashMap;

import flash.events.TimerEvent;
import flash.geom.Point;
import flash.utils.Timer;

import me.pa3.quest.events.UserPerformedGestureEvent;

import me.pa3.quest.utils.BoxUtils;
import me.pa3.quest.vos.Action;
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
    private var _tapHoldTimer:Timer;
    private var _uiLayer:Sprite;
    private var _actionsMenu:ActionsMenuView;

    public function LocationView(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>, walkBoxes:Vector.<Box>) {
        _backgroundLayers = backgroundLayers;
        _actors = actors;
        _walkBoxes = walkBoxes;
        _tapHoldTimer = new Timer(500, 1);
        _tapHoldTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTapTimerComplete);

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

        _uiLayer = new Sprite();
        addChild(_uiLayer);
        // TODO: Если слои перестанут быть размером во весь экран - надо будет переделать.
        _backgroundLayers[_backgroundLayers.length - 1].addEventListener(TouchEvent.TOUCH, onTouch);

        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame():void {
        sortBackgroundLayers();
        var zOrders:Vector.<int> = actorsZOrders;
        sortActors(zOrders);
        sortActorsWithSameZOrder(zOrders);
    }

    private function sortActorsWithSameZOrder(actorsZOrders:Vector.<int>):void {
        for (var i:int = 0; i < _actors.length; i++) {
            for (var j:int = i; j < _actors.length; j++) {
                if (actorsZOrders[i] == actorsZOrders[j] && _actors[i].position.y > _actors[j].position.y && getChildIndex(_actors[i]) < getChildIndex(_actors[j])) {
                    swapChildren(_actors[i], _actors[j]);
                }
            }
        }
    }

    private function sortActors(actorsZOrders:Vector.<int>):void {
        for (var i:int = 0; i < _actors.length; i++) {
            setChildIndex(_actors[i], actorsZOrders[i]);
        }
    }

    private function get actorsZOrders():Vector.<int> {
        var result:Vector.<int> = new Vector.<int>();
        for (var i:int = 0; i < _actors.length; i++) {
            var actor:ActorView = _actors[i];
            var actorsBox:BoxedPoint = BoxUtils.placePointInBox(actor.position, _walkBoxes);
            result[i] = actorsBox.box.zOrder;
        }
        return result;
    }

    private function sortBackgroundLayers():void {
        for (var j:int = 0, i:int = _backgroundLayers.length - 1; i >= 0; i--, j++) {
            setChildIndex(_backgroundLayers[i], i);
        }
    }

    public function getActorPosition(actorId:String):Point {
        var actor:ActorView = ActorView(_actorsById.get(actorId));
        return actor.position;
    }

    private var _touchLocalPoint:Point;

    private function onTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this);
        if (touch) {
            var touchGlobalPoint:Point = new Point(touch.globalX, touch.globalY);
            _touchLocalPoint = new Point();
            globalToLocal(touchGlobalPoint, _touchLocalPoint);
            if (touch.phase == TouchPhase.BEGAN) {
                _tapHoldTimer.start();
            } else if (touch.phase == TouchPhase.ENDED) {
                var action:Action = Action.NONE;
                var touchPoint:Point = _touchLocalPoint;
                if (_uiLayer.contains(_actionsMenu)) {
                    action = _actionsMenu.getActionUnderFinger(touchGlobalPoint);
                    touchPoint = new Point(_actionsMenu.x,  _actionsMenu.y);
                    removeActionsMenu();
                } else {
                    if (_tapHoldTimer.running) {
                        _tapHoldTimer.reset();
                    }
                }

                var actor:ActorView = getActorUnderPoint(touchPoint);
                dispatchEvent(new UserPerformedGestureEvent(actor, action, touchPoint));
            }
        }
    }

    private function getActorUnderPoint(point:Point):ActorView {
        for each (var actor:ActorView in _actors) {
            if (actor.isPointInside(point)) {
                return actor;
            }
        }
        return null;
    }

    private function onTapTimerComplete(event:TimerEvent):void {
        showActionsMenu();
    }

    public function showActionsMenu():void {
        _actionsMenu = new ActionsMenuView(_touchLocalPoint);
        _uiLayer.addChild(_actionsMenu);
    }

    public function removeActionsMenu():void {
        if (_actionsMenu && _uiLayer.contains(_actionsMenu)) {
            _uiLayer.removeChild(_actionsMenu);
        }
    }


}
}
