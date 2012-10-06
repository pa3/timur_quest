package me.pa3.quest.views {
	import me.pa3.quest.events.WalkThePathEvent;

	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Mediator;
import org.robotlegs.mvcs.StarlingMediator;

public class ActorViewMediator extends  StarlingMediator {

		[Inject]
		public var view:ActorView;

		override public function onRegister():void {
            addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
		}

        private function onWalkThePath(e:WalkThePathEvent):void {
			if (e.actorId == view.id) {
				view.walkThePath(e.path);
			}
        }
	}
}
