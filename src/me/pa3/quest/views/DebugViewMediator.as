package me.pa3.quest.views {
import me.pa3.quest.events.WalkMapUpdated;
import me.pa3.quest.events.WalkThePathEvent;

import org.robotlegs.core.IInjector;
import org.robotlegs.mvcs.StarlingMediator;

public class DebugViewMediator extends StarlingMediator{

    [Inject]
    public var view:DebugView;

    [Inject]
    public var injector:IInjector;

    override public function onRegister():void {
        injector.injectInto(view);
        addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
        addContextListener(WalkMapUpdated.EVENT_TYPE, onWalkMapUpdated);
    }

    private function onWalkMapUpdated(e:WalkMapUpdated):void {
        view.drawWalkMap(e.boxes);
    }

    private function onWalkThePath(e:WalkThePathEvent):void {
        view.drawPath(e.path);
    }
}
}
