package me.pa3.quest.commands {

import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.models.WalkMapModel;
import me.pa3.quest.views.ActorView;
import me.pa3.quest.views.TimurView;
import me.pa3.quest.vos.Box;
import me.pa3.quest.vos.BoxVertex;
import me.pa3.quest.vos.ScaleSlot;

import org.robotlegs.mvcs.StarlingCommand;

import starling.display.DisplayObject;

public class GoToLocationCommand extends StarlingCommand {

    [Inject]
    public var event:GoToLocationEvent;

    [Inject]
    public var backgroundModel:BackgroundModel;

    [Inject]
    public var walkMapModel:WalkMapModel;

    override public function execute():void {

        var backgroundLayers:Vector.<DisplayObject> = backgroundModel.getBackgroundLayersById(event.location.backgroundId);

        var timur:TimurView = new TimurView();
        dispatch(new ShowLocationEvent(backgroundLayers, Vector.<ActorView>([timur])));

        walkMapModel.boxes = Vector.<Box>(
                [
                    new Box(new BoxVertex(2 * 310, 2 * 450), new BoxVertex(2 * 380, 2 * 450), new BoxVertex(2 * 340, 2 * 515), new BoxVertex(2 * 160, 2 * 515), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 340, 2 * 515), new BoxVertex(2 * 160, 2 * 515), new BoxVertex(2 * 20, 2 * 575), new BoxVertex(2 * 340, 2 * 575), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 340, 2 * 575), new BoxVertex(2 * 20, 2 * 575), new BoxVertex(2 * 5, 2 * 630), new BoxVertex(2 * 340, 2 * 630), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 955, 2 * 420), new BoxVertex(2 * 340, 2 * 540), new BoxVertex(2 * 340, 2 * 630), new BoxVertex(2 * 955, 2 * 630), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 345, 2 * 420), new BoxVertex(2 * 310, 2 * 425), new BoxVertex(2 * 310, 2 * 450), new BoxVertex(2 * 380, 2 * 450), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 115, 2 * 440), new BoxVertex(2 * 310, 2 * 425), new BoxVertex(2 * 310, 2 * 450), new BoxVertex(2 * 115, 2 * 455), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 115, 2 * 415), new BoxVertex(2 * 45, 2 * 440), new BoxVertex(2 * 45, 2 * 455), new BoxVertex(2 * 115, 2 * 455), new ScaleSlot(400, 0.001, 1200, 1.8), 4),
                    new Box(new BoxVertex(2 * 160, 2 * 400), new BoxVertex(2 * 160, 2 * 420), new BoxVertex(2 * 115, 2 * 435), new BoxVertex(2 * 115, 2 * 415), new ScaleSlot(400, 0.001, 1200, 1.8), 1),
                    new Box(new BoxVertex(2 * 160, 2 * 400), new BoxVertex(2 * 225, 2 * 380), new BoxVertex(2 * 225, 2 * 405), new BoxVertex(2 * 160, 2 * 420), new ScaleSlot(400, 0.001, 1200, 1.8), 1)
                ]
        );


    }
}
}
