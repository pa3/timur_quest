package me.pa3.quest.events {
import flash.geom.Point;

import me.pa3.quest.views.ActorView;

import me.pa3.quest.vos.Action;

import org.robotlegs.mvcs.Actor;

import starling.events.Event;

public class UserPerformedGestureEvent extends Event {
    public static const EVENT_TYPE:String = "UserPerformedGestureEvent";
    private var _actor:ActorView;
    private var _action:Action;
    private var _touchPoint:Point;

    public function UserPerformedGestureEvent(actor:ActorView, action:Action, touchPoint:Point) {
        super(EVENT_TYPE);
        _actor = actor;
        _action = action;
        _touchPoint = touchPoint;
    }

    public function get actor():ActorView {
        return _actor;
    }

    public function get action():Action {
        return _action;
    }

    public function get touchPoint():Point {
        return _touchPoint;
    }
}
}
