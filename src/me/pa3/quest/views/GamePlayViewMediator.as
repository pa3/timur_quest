package me.pa3.quest.views {
import me.pa3.quest.events.ShowLocationEvent;

	import org.robotlegs.core.IInjector;

	import org.robotlegs.mvcs.StarlingMediator;

public class GamePlayViewMediator extends StarlingMediator {

	[Inject]
	public var injector:IInjector;

    [Inject]
    public var view:GamePlayView;

    override public function onRegister():void {
		injector.injectInto(view);
        addContextListener(ShowLocationEvent.EVENT_TYPE, showLocationHandler);
    }

    private function showLocationHandler(e:ShowLocationEvent):void {
        view.showLocation(e.backgroundLayers, e.actors, e.walkBoxes);
    }
}
}
