package me.pa3.quest.events {
import flash.events.Event;

import me.pa3.quest.vos.Action;

public class ActionPickedEvent extends Event {

    public static const EVENT_TYPE:String = "ActionPickedEvent";

    private var _action:Action;

    public function ActionPickedEvent(action:Action) {
        super(EVENT_TYPE);
        _action = action;
    }


    public function get action():Action {
        return _action;
    }
}
}
