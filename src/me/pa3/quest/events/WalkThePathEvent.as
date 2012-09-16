package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.vos.Path;

public class WalkThePathEvent extends Event {
    public static const EVENT_TYPE:String = "WalkThePathEvent";

    private var _actorId:String;
    private var _path:Path;

    public function WalkThePathEvent(actorId:String, path:Path) {
        super(EVENT_TYPE);
        _actorId = actorId;
        _path = path;
    }


    public function get actorId():String {
        return _actorId;
    }

    public function get path():Path {
        return _path;
    }
}
}
