package me.pa3.quest {

	import flash.display.Sprite;

	import me.pa3.quest.events.GoToLocationEvent;

	import me.pa3.quest.views.GamePlayView;
	import me.pa3.quest.vos.Location;

	import org.robotlegs.mvcs.Context;

	[SWF(width=640, height=480)]
	public class TQ extends Sprite {

		private var _context:Context;

		public function TQ() {
			_context = new QuestContext(this);
			addChild(new GamePlayView());
			_context.dispatchEvent(new GoToLocationEvent(new Location("123")));
		}
	}
}
