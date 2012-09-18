package me.pa3.quest.models {

import org.robotlegs.mvcs.Actor;

import starling.display.DisplayObject;
import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.textures.Texture;

public class BackgroundModel extends Actor {

    [Embed(source="/assets/locations/location1/background.jpg")]
    private static const LOCATION1_LAYER1:Class;
    [Embed(source="/assets/locations/location1/layer1.png")]
    private static const LOCATION1_LAYER2:Class;
    [Embed(source="/assets/locations/location1/layer2.png")]
    private static const LOCATION1_LAYER3:Class;

    public function getBackgroundLayersById(backgroundId:String):Vector.<DisplayObject> {
        return Vector.<DisplayObject>([
            Image.fromBitmap(new LOCATION1_LAYER1),
            Image.fromBitmap(new LOCATION1_LAYER2),
            Image.fromBitmap(new LOCATION1_LAYER3)
        ]);
    }
}
}


