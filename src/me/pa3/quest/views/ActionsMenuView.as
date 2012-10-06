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

    private var _lookIcon:Image;

    private var _pickIcon:Image;

    private var _walkIcon:Image;

    private function onAddedToStage(event:Event):void {
        this.x = _position.x;
        this.y = _position.y;

        _lookIcon = new Image(Texture.fromBitmap(new LookIcon()));
        _pickIcon = new Image(Texture.fromBitmap(new PickIcon()));
        _walkIcon = new Image(Texture.fromBitmap(new WalkIcon()));

        _lookIcon.x = 0;
        _pickIcon.x = _lookIcon.width;
        _walkIcon.x = _lookIcon.width + _pickIcon.width;

        this.addChild(_lookIcon);
        this.addChild(_pickIcon);
        this.addChild(_walkIcon);

        _lookIcon.addEventListener(TouchEvent.TOUCH, onTouch);
        _pickIcon.addEventListener(TouchEvent.TOUCH, onTouch);
        _walkIcon.addEventListener(TouchEvent.TOUCH, onTouch);
    }

    private function onTouch(e:TouchEvent):void {
        var touch:Touch = e.getTouch(this);
        if (touch && touch.phase == TouchPhase.ENDED) {
            switch (touch.target) {
                case _lookIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.LOOK));
                    break;
                case _pickIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.PICK));
                    break;
                case _walkIcon:
                    dispatchEvent(new ActionIconClickedEvent(Action.WALK));
                    break;
            }

        }
    }

}
}
