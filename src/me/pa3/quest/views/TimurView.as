package me.pa3.quest.views {
	import flash.geom.Point;
	import flash.geom.Rectangle;

	import me.pa3.quest.events.WalkThePathEvent;

	import me.pa3.quest.events.WalkThePathEvent;
import me.pa3.quest.utils.InputScaler;

import me.pa3.quest.vos.Path;
	import me.pa3.quest.vos.WayPoint;

	import starling.animation.Transitions;

	import starling.animation.Tween;

	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class TimurView extends ActorView {

		[Embed(source="/assets/actors/timur/timur.png")]
		private const WALK_SPRITE_SHEET:Class;

		[Embed(source="/assets/actors/timur/timur.xml", mimeType="application/octet-stream")]
		private const ANIMATION_ATLAS:Class;

		public function TimurView() {
            super("timur");
		}

		override protected function createAnimations():void {
			var texture:Texture = Texture.fromBitmap(new WALK_SPRITE_SHEET, true, true, 1);
			var xml:XML = XML(new ANIMATION_ATLAS);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			addAnimation("move", new MovieClip(atlas.getTextures("Timur_walk"), 10));
			addAnimation("stand", new MovieClip(atlas.getTextures("Timur_stand"),  10));
            switchAnimationTo("stand");
		}


	}
}
