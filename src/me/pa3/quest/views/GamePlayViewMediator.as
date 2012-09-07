package me.pa3.quest.views {
	import flash.display.DisplayObject;

	import me.pa3.quest.events.ShowLocationEvent;

	import org.robotlegs.mvcs.Mediator;

	public class GamePlayViewMediator extends Mediator {

		[Inject]
		public var view:GamePlayView;

		override public function onRegister():void {
			addContextListener(ShowLocationEvent.EVENT_TYPE, showLocationHandler);
		}

		private function showLocationHandler(e:ShowLocationEvent):void {
			view.showLocation(e.background);
		}
	}
}
