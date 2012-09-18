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

        [Inject]
        public var inputScaler:InputScaler;

		[Embed(source="/assets/actors/timur/timur.png")]
		private const WALK_SPRITE_SHEET:Class;

		[Embed(source="/assets/actors/timur/timur.xml", mimeType="application/octet-stream")]
		private const ANIMATION_ATLAS:Class;

		private var _walkAnimation:MovieClip;
        private var _standAnimation:MovieClip;
		private var _currentAnimation:MovieClip;
		private var _currentPath:Path;


		public function TimurView() {
            super("timur");
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		public function walkThePath(path:Path):void {
			_currentPath = path;
            switchAnimationTo(_walkAnimation);
			walkToNextPoint();
		}

		private function walkToNextPoint():void {
			if (_currentPath && _currentPath.hasMorePoints()) {
				var nextWayPoint:WayPoint = _currentPath.getNextPoint();
				var tween:Tween = new Tween(this, 0);
				tween.moveTo(nextWayPoint.point.x, nextWayPoint.point.y);
				tween.scaleTo(nextWayPoint.scale);
				tween.onComplete = walkToNextPoint;
				Starling.juggler.add(tween);
			} else {
                switchAnimationTo(_standAnimation);
            }
		}

		private function switchAnimationTo(animation:MovieClip):void {
			if (_currentAnimation && contains(_currentAnimation)) {
				removeChild(_currentAnimation);
				Starling.juggler.remove(_currentAnimation);
			}
			_currentAnimation = animation;
            _currentAnimation.x = - _currentAnimation.width/2;
            _currentAnimation.y = -_currentAnimation.height;
			addChild(_currentAnimation);

			Starling.juggler.add(_currentAnimation);
		}


		private function init(event:Event):void {
			var texture:Texture = Texture.fromBitmap(new WALK_SPRITE_SHEET, true, true, 1);
			var xml:XML = XML(new ANIMATION_ATLAS);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			_walkAnimation = new MovieClip(atlas.getTextures("Timur_walk"), 10);
            _standAnimation = new MovieClip(atlas.getTextures("Timur_stand"),  10);
            switchAnimationTo(_standAnimation);
		}
	}
}
