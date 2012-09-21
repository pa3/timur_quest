package me.pa3.quest.views {
	import me.pa3.quest.events.WalkThePathEvent;

	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Mediator;

	public class ActorViewMediator extends  Mediator {

		[Inject]
		public var view:ActorView;

        [Inject]
        public var injector:IInjector;

		override public function onRegister():void {
            injector.injectInto(view);
            addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
		}

        private function onWalkThePath(e:WalkThePathEvent):void {
			if (e.actorId == view.id) {
				view.walkThePath(e.path);
			}
        }
	}
}
