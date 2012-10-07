package me.pa3.quest.views {
import flash.geom.Point;

import me.pa3.quest.events.ActionIconClickedEvent;
import me.pa3.quest.vos.Action;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class ActionsMenuView extends Sprite {

    [Embed(source="/assets/raw/gui/look.jpg")]
    private const LookIcon:Class;
    [Embed(source="/assets/raw/gui/pick.jpg")]
    private const PickIcon:Class;
    [Embed(source="/assets/raw/gui/walk.jpg")]
    private const WalkIcon:Class;

    private var _position:Point;

    public function ActionsMenuView(position:Point) {
        _position = position;
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private var _eyeIcon:Image;

    private var _handIcon:Image;

    private var _bootIcon:Image;

    private function onAddedToStage(event:Event):void {
        this.x = _position.x;
        this.y = _position.y;

        _eyeIcon = new Image(Texture.fromBitmap(new LookIcon()));
        _handIcon = new Image(Texture.fromBitmap(new PickIcon()));
        _bootIcon = new Image(Texture.fromBitmap(new WalkIcon()));

        _eyeIcon.x = 0;
        _handIcon.x = _eyeIcon.width;
        _bootIcon.x = _eyeIcon.width + _handIcon.width;

        this.addChild(_eyeIcon);
        this.addChild(_handIcon);
        this.addChild(_bootIcon);

        _eyeIcon.addEventListener(TouchEvent.TOUCH, onTouch);
        _handIcon.addEventListener(TouchEvent.TOUCH, onTouch);
        _bootIcon.addEventListener(TouchEvent.TOUCH, onTouch);
    }

    private function onTouch(e:TouchEvent):void {
        var touch:Touch = e.getTouch(this);
        if (touch && touch.phase == TouchPhase.ENDED) {
            switch (touch.target) {
                case _eyeIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.EYE));
                    break;
                case _handIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.HAND));
                    break;
                case _bootIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.BOOT));
                    break;
            }

        }
    }

    public function handleTouchEnd(globalPoint:Point):void {
        var localPoint:Point = new Point();
        globalToLocal(globalPoint, localPoint);
        switch (hitTest(localPoint)) {
            case _eyeIcon:
                trace("use eye");
                break;
            case _bootIcon:
                trace("use boot");
                break;
            case _handIcon:
                trace("use hand");
                break;
        }

    }
}
}
