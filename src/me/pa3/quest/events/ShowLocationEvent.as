package me.pa3.quest.events {
import flash.events.Event;

import starling.display.DisplayObject;

public class ShowLocationEvent extends Event {

    public static const EVENT_TYPE:String = "ShowLocationEvent";
    private var _background:DisplayObject;
    private var _actors:Vector.<DisplayObject>;


    public function ShowLocationEvent(background:DisplayObject, actors:Vector.<DisplayObject>) {
        super(EVENT_TYPE);
        _background = background;
        _actors = actors;
    }

    public function get background():DisplayObject {
        return _background;
    }

    public function get actors():Vector.<DisplayObject> {
        return _actors;
    }
}
}
