package me.pa3.quest.commands {

import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.views.TimurView;

import org.robotlegs.mvcs.StarlingCommand;

import starling.display.DisplayObject;

public class GoToLocationCommand extends StarlingCommand {

    [Inject]
    public var event:GoToLocationEvent;

    [Inject]
    public var backgroundModel:BackgroundModel;

    override public function execute():void {
        var background:DisplayObject = backgroundModel.getBackgroundById(event.location.backgroundId);
        var timur:TimurView = new TimurView();
        dispatch(new ShowLocationEvent(background, Vector.<DisplayObject>([timur])));
    }
}
}
