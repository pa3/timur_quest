package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.vos.Box;

public class WalkMapUpdated extends Event {
    private var _boxes:Vector.<Box>;
    public static const EVENT_TYPE:String = "WalkMapUpdated";

    public function WalkMapUpdated(boxes:Vector.<Box>) {
        super(EVENT_TYPE);
        _boxes = boxes;
    }

    public function get boxes():Vector.<Box> {
        return _boxes;
    }
}
}
