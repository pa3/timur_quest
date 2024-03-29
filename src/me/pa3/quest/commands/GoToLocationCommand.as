package me.pa3.quest.commands {

import flash.geom.Point;

import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.models.WalkMapModel;
import me.pa3.quest.utils.BoxUtils;
import me.pa3.quest.views.ActorView;
import me.pa3.quest.models.ActorViewsCreatorModel;
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

    [Inject]
    public var actorsFactory:ActorViewsCreatorModel;

    override public function execute():void {
        var boxes:Vector.<Box> = Vector.<Box>(
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


        var backgroundLayers:Vector.<DisplayObject> = backgroundModel.getBackgroundLayersById(event.location.backgroundId);
        var timur:ActorView = actorsFactory.createActor("timur");
        var marina:ActorView = actorsFactory.createActor("marina");
        timur.position = BoxUtils.placePointInBox(timur.position, boxes).point;
        marina.x = 800;
        marina.y = 800;
        marina.position = BoxUtils.placePointInBox(marina.position, boxes).point;
        dispatch(new ShowLocationEvent(backgroundLayers, Vector.<ActorView>([timur, marina]), boxes));
        walkMapModel.boxes = boxes;

    }
}
}
