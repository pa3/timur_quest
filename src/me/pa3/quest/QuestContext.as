package me.pa3.quest {

import flash.geom.Point;

import me.pa3.quest.commands.GoToLocationCommand;
	import me.pa3.quest.commands.HandleUserActionCommand;
	import me.pa3.quest.commands.NotifyAboutWalkFinishedCommand;
	import me.pa3.quest.commands.WalkToPointCommand;
import me.pa3.quest.events.GoToLocationEvent;
	import me.pa3.quest.events.HandleUserActionEvent;
	import me.pa3.quest.events.NotifyAboutWalkFinishedEvent;
	import me.pa3.quest.events.WalkToPointEvent;
import me.pa3.quest.models.BackgroundModel;
import me.pa3.quest.models.WalkMapModel;
	import me.pa3.quest.services.ActionsHandlerService;
	import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.views.ActionsMenuView;
import me.pa3.quest.views.ActionsMenuViewMediator;
import me.pa3.quest.views.ActorView;
import me.pa3.quest.views.ActorViewMediator;
import me.pa3.quest.models.ActorViewsCreatorModel;
import me.pa3.quest.views.DebugView;
import me.pa3.quest.views.DebugViewMediator;
import me.pa3.quest.views.GamePlayView;
import me.pa3.quest.views.GamePlayViewMediator;
import me.pa3.quest.views.LocationView;
import me.pa3.quest.views.LocationViewMediator;

import org.robotlegs.mvcs.StarlingContext;

import starling.display.DisplayObjectContainer;

public class QuestContext extends StarlingContext {

    private var _inputScaler:InputScaler

    public function QuestContext(contextView:DisplayObjectContainer, inputScaler:InputScaler) {
        _inputScaler = inputScaler;
        super(contextView);
    }


    override public function startup():void {
        super.startup();

        injector.mapValue(InputScaler, _inputScaler);
        injector.mapSingleton(ActorViewsCreatorModel);
        injector.mapSingleton(BackgroundModel);
        injector.mapSingleton(WalkMapModel);
		injector.mapSingletonOf(ActionsHandlerService, ActionsHandlerService);


        commandMap.mapEvent(GoToLocationEvent.EVENT_TYPE, GoToLocationCommand);
        commandMap.mapEvent(WalkToPointEvent.EVENT_TYPE, WalkToPointCommand);
		commandMap.mapEvent(HandleUserActionEvent.EVENT_TYPE, HandleUserActionCommand);
		commandMap.mapEvent(NotifyAboutWalkFinishedEvent.EVENT_TYPE, NotifyAboutWalkFinishedCommand);

        mediatorMap.mapView(GamePlayView, GamePlayViewMediator);
        mediatorMap.mapView(ActorView, ActorViewMediator);
        mediatorMap.mapView(LocationView, LocationViewMediator);
        mediatorMap.mapView(DebugView, DebugViewMediator);
        mediatorMap.mapView(ActionsMenuView, ActionsMenuViewMediator);

    }

    public function get inputScaler():InputScaler {
        return _inputScaler;
    }
}
}
