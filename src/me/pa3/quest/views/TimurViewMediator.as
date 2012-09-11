package me.pa3.quest.views {
	import flash.geom.Point;

	import me.pa3.quest.vos.Path;

	import org.robotlegs.mvcs.StarlingMediator;

	public class TimurViewMediator extends  StarlingMediator {

		[Inject]
		public var view:TimurView;

		override public function onRegister():void {
			view.walkThePath(new Path(Vector.<Point>([new Point(500,500), new Point(500,100), new Point(100,500)])));
		}
	}
}
