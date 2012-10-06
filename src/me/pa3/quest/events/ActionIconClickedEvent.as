package me.pa3.quest.events {
import me.pa3.quest.vos.Action;

import starling.events.Event;

public class ActionIconClickedEvent extends Event {

    public static const EVENT_TYPE:String = "ActionIconClickedEvent";

    private var _action:Action;

    public function ActionIconClickedEvent(action:Action) {
        super(EVENT_TYPE);
        _action = action;
    }

    public function get action():Action {
        return _action;
    }
}
}
