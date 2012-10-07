package me.pa3.quest.views {
	import flash.events.MouseEvent;

import me.pa3.quest.events.ActionIconClickedEvent;
import me.pa3.quest.events.ActionPickedEvent;

import me.pa3.quest.events.WalkToPointEvent;

	import me.pa3.quest.events.LocationClickedEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	public class LocationViewMediator extends StarlingMediator{

		[Inject]
		public var view:LocationView;

		override public function onRegister():void {
			super.onRegister();
			view.addEventListener(LocationClickedEvent.EVENT_TYPE, onMouseClick);
            addContextListener(ActionPickedEvent.EVENT_TYPE, onActionPicked);
		}

        private function onActionPicked(e:ActionPickedEvent):void {
            view.removeActionsMenu();
        }

		private function onMouseClick(e:LocationClickedEvent):void {
			dispatch(new WalkToPointEvent("timur", view.getActorPosition("timur"), e.point));
		}


	}
}
