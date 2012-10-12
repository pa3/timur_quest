package me.pa3.quest.views {
	import de.polygonal.ds.HashMap;
	import de.polygonal.ds.Map;

import flash.geom.Point;
import flash.geom.Rectangle;

	import me.pa3.quest.events.WalkFinishedViewEvent;

	import me.pa3.quest.vos.Path;
	import me.pa3.quest.vos.WayPoint;

	import starling.animation.Tween;
	import starling.core.Starling;

	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;

	public class ActorView extends Sprite {
		private var _id:String;

		private var _currentAnimation:MovieClip;
		private var _currentPath:Path;

		private var _animationById:Map = new HashMap();

        private var _currentWalkTween:Tween;
        private var _boundBox:Rectangle;

        public function ActorView(id:String, boundBox:Rectangle) {
			_id = id;
            _boundBox = boundBox;
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		public function get id():String {
			return _id;
		}

		public function addAnimation(animationId:String, animation:MovieClip):void {
			_animationById.set(animationId, animation);
		}

		public function walkThePath(path:Path):void {
			_currentPath = path;
            if (_currentWalkTween) {
                Starling.juggler.remove(_currentWalkTween);
            }
			switchAnimationTo("move");
			walkToNextPoint();
		}

		private function onAddedToStage(event:Event):void {
            switchAnimationTo("stand");
		}

        private function walkToNextPoint():void {
			if (_currentPath && _currentPath.hasMorePoints()) {

                var currentPosition:Point = position;

				var nextWayPoint:WayPoint = _currentPath.getNextPoint();
                scaleX = Math.abs(scaleX) * ((nextWayPoint.point.x > x) ? -1 : 1);

                _currentWalkTween = new Tween(this, currentPosition.subtract(nextWayPoint.point).length/500);
				_currentWalkTween.moveTo(nextWayPoint.point.x, nextWayPoint.point.y);
                _currentWalkTween.animate("scaleX", Math.abs(nextWayPoint.scale) * ((nextWayPoint.point.x > x) ? -1 : 1));
                _currentWalkTween.animate("scaleY", nextWayPoint.scale);
				_currentWalkTween.onComplete = walkToNextPoint;
				Starling.juggler.add(_currentWalkTween);
			} else {
				dispatchEvent(new WalkFinishedViewEvent(id, position));
				switchAnimationTo("stand");
			}
		}

		public function switchAnimationTo(animationId:String):void {
			var animation:MovieClip = MovieClip(_animationById.get(animationId));
			if (_currentAnimation && contains(_currentAnimation)) {
				removeChild(_currentAnimation);
				Starling.juggler.remove(_currentAnimation);
			}
			_currentAnimation = animation;
			_currentAnimation.x = -_currentAnimation.width/2;
			_currentAnimation.y = -_currentAnimation.height;
			addChild(_currentAnimation);

			Starling.juggler.add(_currentAnimation);
		}

        public function get position():Point {
            return new Point(x, y);
        }

        public function set position(value:Point):void {
            x = value.x;
            y = value.y;
        }

        public function isPointInside(point:Point):Boolean {
            return (boundBox.containsPoint(point));
        }

        public function get boundBox():Rectangle {
            return new Rectangle(x+scaleX*_boundBox.x, y+scaleY*_boundBox.y,scaleX*_boundBox.width,scaleY*_boundBox.height);
        }
    }
}
