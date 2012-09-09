package me.pa3.quest.views {
import starling.display.DisplayObject;
import starling.display.Sprite;

public class LocationView extends Sprite {
		public function LocationView(background:DisplayObject, actors:Vector.<DisplayObject>) {
            addChild(background);
            for each (var anActor:DisplayObject in actors) {
                addChild(anActor);
            }
		}
	}
}
