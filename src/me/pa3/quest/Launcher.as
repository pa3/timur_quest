package me.pa3.quest {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import org.robotlegs.mvcs.Context;

import starling.core.Starling;

[SWF(width=80, height=60)]
public class Launcher extends Sprite {

    private var _starling:Starling;

    public function Launcher() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        _starling = new Starling(GameEntryPoint, stage, new Rectangle(0,0,80,60));
        _starling.start();
    }
}
}
