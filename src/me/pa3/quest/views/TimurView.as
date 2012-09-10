package me.pa3.quest.views {
import flash.geom.Point;

import starling.animation.Tween;

import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class TimurView extends Sprite {

    [Embed(source="/actors/timur/walk.png")]
    private const WALK_SPRITE_SHEET:Class;

    [Embed(source="/actors/timur/walk.xml", mimeType="application/octet-stream")]
    private const ANIMATION_ATLAS:Class;

    private var walkAnimation:MovieClip;
    private var _currentAnimation:MovieClip;

    public function TimurView () {
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    public function showWalkAnimation():void {
        switchAnimationTo(walkAnimation);
    }

    public function walkTo(point:Point):void {
        if (point.x - x > 0) {
            this.scaleX = -1;
        } else {
            this.scaleX = 1;
        }
        var tween:Tween = new Tween(this, 3);
        tween.moveTo(point.x, point.y);
        tween.animate("scaleX", point.x - x > 0 ? -0.5: 0.5);
        tween.animate("scaleY", 0.5);
        Starling.juggler.add(tween);
    }

    private function switchAnimationTo(animation:MovieClip):void {
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

    private function init(event:Event):void {
        trace("event.bubbles = " + event.bubbles);
        var texture:Texture = Texture.fromBitmap(new WALK_SPRITE_SHEET, true, true, 1);
        var xml:XML = XML(new ANIMATION_ATLAS);
        var atlas:TextureAtlas = new TextureAtlas(texture, xml);
        walkAnimation = new MovieClip(atlas.getTextures("Timur_walk"), 10);
        showWalkAnimation();
    }



}
}
