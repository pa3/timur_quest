package me.pa3.quest {
import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.views.GamePlayView;
import me.pa3.quest.vos.Location;

import org.robotlegs.mvcs.StarlingContext;

import starling.display.Sprite;
import starling.events.Event;

public class GameEntryPoint extends Sprite {

    private  var _context:StarlingContext;
    public function GameEntryPoint() {
        super();
        _context = new QuestContext(this);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        addChild(new GamePlayView());
        _context.dispatchEvent(new GoToLocationEvent(new Location("123")));
    }
}
}
