package me.pa3.quest.views {
	import me.pa3.quest.events.NotifyAboutWalkFinishedEvent;
	import me.pa3.quest.events.WalkFinishedViewEvent;
	import me.pa3.quest.events.WalkThePathEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	public class ActorViewMediator extends StarlingMediator {

		[Inject]
		public var view:ActorView;

		override public function onRegister():void {
			view.addEventListener(WalkFinishedViewEvent.EVENT_TYPE, onWalkFinished);
			addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
		}

		private function onWalkFinished(event:WalkFinishedViewEvent):void {
			dispatch(new NotifyAboutWalkFinishedEvent(event));
		}

		private function onWalkThePath(e:WalkThePathEvent):void {
			if (e.actorId == view.id) {
				view.walkThePath(e.path);
			}
		}
	}
}
