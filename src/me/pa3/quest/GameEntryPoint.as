package me.pa3.quest {
import flash.geom.Point;

import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.views.DebugView;
import me.pa3.quest.views.GamePlayView;
import me.pa3.quest.vos.Location;

import org.robotlegs.mvcs.StarlingContext;

import starling.display.Sprite;
import starling.events.Event;

public class GameEntryPoint extends Sprite {

    private  var _context:StarlingContext;
    private var _inputScaler:InputScaler;

    public function GameEntryPoint() {
        super();
        _inputScaler = new InputScaler(new Point(800, 600), new Point(1920, 1280));
        _context = new QuestContext(this, _inputScaler);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        addChild(new GamePlayView());
        var debugView:DebugView = new DebugView();
        debugView.scaleX = _inputScaler.worldToViewScale.x;
        debugView.scaleY = _inputScaler.worldToViewScale.y;

        addChild(debugView);
        _context.dispatchEvent(new GoToLocationEvent(new Location("123")));
    }
}
}
