package me.pa3.quest.views {
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Event;

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
            addChild(anActor);
        }
    }
}
}
