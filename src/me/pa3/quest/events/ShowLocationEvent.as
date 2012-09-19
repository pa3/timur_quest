package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.views.ActorView;
import me.pa3.quest.vos.Box;

import starling.display.DisplayObject;

public class ShowLocationEvent extends Event {

    public static const EVENT_TYPE:String = "ShowLocationEvent";
    private var _backgroundLayers:Vector.<DisplayObject>;
    private var _actors:Vector.<ActorView>;
    private var _walkBoxes:Vector.<Box>;


    public function ShowLocationEvent(backgroundLayers:Vector.<DisplayObject>, actors:Vector.<ActorView>,walkBoxes:Vector.<Box>) {
        super(EVENT_TYPE);
        _backgroundLayers = backgroundLayers;
        _actors = actors;
        _walkBoxes = walkBoxes;
    }


    public function get backgroundLayers():Vector.<DisplayObject> {
        return _backgroundLayers;
    }

    public function get actors():Vector.<ActorView> {
        return _actors;
    }


    public function get walkBoxes():Vector.<Box> {
        return _walkBoxes;
    }
}
}
