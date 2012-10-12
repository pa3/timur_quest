package me.pa3.quest.views {
import me.pa3.quest.events.ActionPickedEvent;
	import me.pa3.quest.events.HandleUserActionEvent;
	import me.pa3.quest.events.UserPerformedGestureEvent;
import me.pa3.quest.events.WalkToPointEvent;
	import me.pa3.quest.vos.Action;

	import org.robotlegs.mvcs.StarlingMediator;

public class LocationViewMediator extends StarlingMediator {

    [Inject]
    public var view:LocationView;

    override public function onRegister():void {
        super.onRegister();
        view.addEventListener(UserPerformedGestureEvent.EVENT_TYPE, onUserGesture);
        addContextListener(ActionPickedEvent.EVENT_TYPE, onActionPicked);
    }

    private function onUserGesture(event:UserPerformedGestureEvent):void {
        var message:String = "Use ";
        message += event.action;
        message += " on ";
        message += (event.actor != null) ? event.actor.id : event.touchPoint.toString();
        trace(message);
		dispatch(new HandleUserActionEvent(event));

		if (event.action == Action.NONE) {
			dispatch(new WalkToPointEvent("timur", view.getActorPosition("timur"), event.touchPoint));
		}

    }

    private function onActionPicked(e:ActionPickedEvent):void {
        view.removeActionsMenu();
    }
}
}
