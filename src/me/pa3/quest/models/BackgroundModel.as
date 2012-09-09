package me.pa3.quest.models {

import org.robotlegs.mvcs.Actor;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.textures.Texture;

public class BackgroundModel extends Actor {

    [Embed(source="/locations/backgrounds/location1.jpg")]
    private static const LOCATION1_BACKGROUND:Class;

    public function getBackgroundById(backgroundId:String):DisplayObject {
        var background:DisplayObject = Image.fromBitmap(new LOCATION1_BACKGROUND());
        return background;
    }
}
}


