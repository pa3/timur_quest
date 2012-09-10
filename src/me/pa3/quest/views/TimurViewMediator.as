package me.pa3.quest.views {
import flash.geom.Point;

import org.robotlegs.mvcs.StarlingMediator;

public class TimurViewMediator extends StarlingMediator{

    [Inject]
    public var view:TimurView;

    override public function onRegister():void {
        view.walkTo(new Point(500,500));
    }
}
}
