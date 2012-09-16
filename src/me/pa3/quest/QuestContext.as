package me.pa3.quest {

	import flash.geom.Point;

	import me.pa3.quest.commands.GoToLocationCommand;
import me.pa3.quest.commands.WalkToPointCommand;
import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.events.WalkToPointEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.models.WalkMapModel;
import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.views.DebugView;
import me.pa3.quest.views.DebugViewMediator;
import me.pa3.quest.views.GamePlayView;
import me.pa3.quest.views.GamePlayViewMediator;
	import me.pa3.quest.views.LocationView;
	import me.pa3.quest.views.LocationViewMediator;
	import me.pa3.quest.views.TimurView;
import me.pa3.quest.views.TimurViewMediator;

import org.robotlegs.mvcs.Context;
import org.robotlegs.mvcs.StarlingContext;

import starling.display.DisplayObjectContainer;

public class QuestContext extends StarlingContext {

    public function QuestContext(contextView:DisplayObjectContainer) {
        super(contextView);
    }

    override public function startup():void {
        super.startup();

		var inputScaler:InputScaler = new InputScaler(new Point(800, 600), new Point(1920, 1280));
		injector.mapValue(InputScaler, inputScaler);
        injector.mapSingleton(BackgroundModel);
        injector.mapSingleton(WalkMapModel);

        commandMap.mapEvent(GoToLocationEvent.EVENT_TYPE, GoToLocationCommand);
        commandMap.mapEvent(WalkToPointEvent.EVENT_TYPE, WalkToPointCommand);

        mediatorMap.mapView(GamePlayView, GamePlayViewMediator);
        mediatorMap.mapView(TimurView, TimurViewMediator);
		mediatorMap.mapView(LocationView, LocationViewMediator);
        mediatorMap.mapView(DebugView, DebugViewMediator);

    }
}
}
