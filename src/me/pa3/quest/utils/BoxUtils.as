package me.pa3.quest.utils {
import flash.geom.Point;

import me.pa3.quest.vos.Box;

import me.pa3.quest.vos.BoxedPoint;

public class BoxUtils {
    public static function placePointInBox(inputPoint:Point, boxes:Vector.<Box>):BoxedPoint {
        var resultPoint:Point = inputPoint;
        var resultBox:Box = null;
        var destToResultBox:Number = Number.MAX_VALUE;
        for each (var aBox:Box in boxes) {
            var nearestPoint:Point = aBox.getNearestPoint(inputPoint);
            var dest:Number = nearestPoint.subtract(inputPoint).length;
            if (dest < destToResultBox) {
                resultBox = aBox;
                destToResultBox = dest;
                resultPoint = nearestPoint;
            }
        }
        return new BoxedPoint(resultPoint.clone(), resultBox);
    }}
}
