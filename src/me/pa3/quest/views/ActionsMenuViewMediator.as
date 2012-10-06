package me.pa3.quest.views {
import me.pa3.quest.events.ActionIconClickedEvent;
import me.pa3.quest.events.ActionPickedEvent;

import org.robotlegs.mvcs.StarlingMediator;

public class ActionsMenuViewMediator extends StarlingMediator{

    [Inject]
    public var view:ActionsMenuView;

    override public function onRegister():void {
        view.addEventListener(ActionIconClickedEvent.EVENT_TYPE, onActionIconClicked);
    }

    private function onActionIconClicked(e:ActionIconClickedEvent):void {
        dispatch(new ActionPickedEvent(e.action));
    }
}

}
