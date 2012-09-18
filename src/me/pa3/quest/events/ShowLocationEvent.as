package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.views.ActorView;

import starling.display.DisplayObject;

public class ShowLocationEvent extends Event {

    public static const EVENT_TYPE:String = "ShowLocationEvent";
    private var _backgroundLayers:Vector.<DisplayObject>;
    private var _actors:Vector.<ActorView>;


    public function ShowLocationEvent(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>) {
        super(EVENT_TYPE);
        _backgroundLayers = backgroundLayers;
        _actors = actors;
    }


    public function get backgroundLayers():Vector.<DisplayObject> {
        return _backgroundLayers;
    }

    public function get actors():Vector.<ActorView> {
        return _actors;
    }
}
}
