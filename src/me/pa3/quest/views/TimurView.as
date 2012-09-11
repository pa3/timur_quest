package me.pa3.quest.views {
	import flash.geom.Point;

	import me.pa3.quest.events.WalkThePathEvent;

	import me.pa3.quest.events.WalkThePathEvent;

	import me.pa3.quest.vos.Path;

	import starling.animation.Transitions;

	import starling.animation.Tween;

	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class TimurView extends Sprite {

		[Embed(source="/assets/actors/timur/walk.png")]
		private const WALK_SPRITE_SHEET:Class;

		[Embed(source="/assets/actors/timur/walk.xml", mimeType="application/octet-stream")]
		private const ANIMATION_ATLAS:Class;

		private var walkAnimation:MovieClip;
		private var _currentAnimation:MovieClip;
		private var _currentPath:Path;

		public function TimurView() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		public function showWalkAnimation():void {
			switchAnimationTo(walkAnimation);
		}

		public function walkThePath(path:Path):void {
			_currentPath = path;
			walkToNextPoint();
		}

		private function walkToNextPoint():void {
			if (_currentPath && _currentPath.hasMorePoints()) {
				var nextPoint:Point = _currentPath.getNextPoint();
				var tween:Tween = new Tween(this, 2, Transitions.EASE_IN);
				tween.moveTo(nextPoint.x, nextPoint.y);
				tween.onComplete = walkToNextPoint;
				Starling.juggler.add(tween);
			}
		}

		private function switchAnimationTo(animation:MovieClip):void {
			if (_currentAnimation && contains(_currentAnimation)) {
				removeChild(_currentAnimation);
				Starling.juggler.remove(_currentAnimation);
			}
			_currentAnimation = animation;
			addChild(_currentAnimation);
			Starling.juggler.add(_currentAnimation);
		}


		private function init(event:Event):void {
			var texture:Texture = Texture.fromBitmap(new WALK_SPRITE_SHEET, true, true, 1);
			var xml:XML = XML(new ANIMATION_ATLAS);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			walkAnimation = new MovieClip(atlas.getTextures("Timur_walk"), 10);
			showWalkAnimation();
		}

	}
}
