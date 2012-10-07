package me.pa3.quest.views {
import me.pa3.quest.events.ShowLocationEvent;
import me.pa3.quest.events.WalkMapUpdated;
import me.pa3.quest.events.WalkThePathEvent;

import org.robotlegs.core.IInjector;
import org.robotlegs.mvcs.StarlingMediator;

public class DebugViewMediator extends StarlingMediator{

    [Inject]
    public var view:DebugView;

    override public function onRegister():void {
        addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
        addContextListener(WalkMapUpdated.EVENT_TYPE, onWalkMapUpdated);
        addContextListener(ShowLocationEvent.EVENT_TYPE, showLocationHandler);
    }

    private function showLocationHandler(e:ShowLocationEvent):void {
        for each (var actor:ActorView in e.actors) {
            view.showActorsBounds(actor);
        }
    }

    private function onWalkMapUpdated(e:WalkMapUpdated):void {
        view.drawWalkMap(e.boxes);
    }

    private function onWalkThePath(e:WalkThePathEvent):void {
        view.drawPath(e.path);
    }
}
}
