package me.pa3.quest.views {
	import flash.geom.Point;

import me.pa3.quest.events.WalkThePathEvent;

import me.pa3.quest.vos.Path;

import org.robotlegs.core.IInjector;

import org.robotlegs.mvcs.StarlingMediator;

	public class TimurViewMediator extends  StarlingMediator {

		[Inject]
		public var view:TimurView;

        [Inject]
        public var injector:IInjector;

		override public function onRegister():void {
            injector.injectInto(view);
            addContextListener(WalkThePathEvent.EVENT_TYPE, onWalkThePath);
		}

        private function onWalkThePath(e:WalkThePathEvent):void {
            if (e.actorId == "timur") {
                view.walkThePath(e.path);
            }
        }
	}
}
