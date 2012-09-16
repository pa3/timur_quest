package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.views.ActorView;

import starling.display.DisplayObject;

public class ShowLocationEvent extends Event {

    public static const EVENT_TYPE:String = "ShowLocationEvent";
    private var _background:DisplayObject;
    private var _actors:Vector.<ActorView>;


    public function ShowLocationEvent(background:DisplayObject, actors:Vector.<ActorView>) {
        super(EVENT_TYPE);
        _background = background;
        _actors = actors;
    }

    public function get background():DisplayObject {
        return _background;
    }

    public function get actors():Vector.<ActorView> {
        return _actors;
    }
}
}
