package me.pa3.quest {

import me.pa3.quest.commands.GoToLocationCommand;
import me.pa3.quest.events.GoToLocationEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.views.GamePlayView;
import me.pa3.quest.views.GamePlayViewMediator;

import org.robotlegs.mvcs.Context;
import org.robotlegs.mvcs.StarlingContext;

import starling.display.DisplayObjectContainer;

public class QuestContext extends StarlingContext {

    public function QuestContext(contextView:DisplayObjectContainer) {
        super(contextView);
    }

    override public function startup():void {
        super.startup();

        injector.mapSingleton(BackgroundModel);

        commandMap.mapEvent(GoToLocationEvent.EVENT_TYPE, GoToLocationCommand);

        mediatorMap.mapView(GamePlayView, GamePlayViewMediator);

    }
}
}
