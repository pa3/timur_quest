package me.pa3.quest.views {
import starling.display.Sprite;

public class ActorView extends Sprite {
    private var _id:String;

    public function ActorView(id:String) {
        _id = id;
    }

    public function get id():String {
        return _id;
    }
}
}
