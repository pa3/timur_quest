package me.pa3.quest.views {
import starling.display.Sprite;
import starling.events.Event;

public class ActionsMenuView extends Sprite {
    public function ActionsMenuView() {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        addChild();
    }
}
}
