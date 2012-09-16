package me.pa3.quest.views {
import me.pa3.quest.utils.InputScaler;
import me.pa3.quest.views.debug.Line;
import me.pa3.quest.vos.Box;
import me.pa3.quest.vos.BoxVertex;
import me.pa3.quest.vos.Path;

import starling.display.Sprite;

public class DebugView extends Sprite {
    [Inject]
    public var inputScaler:InputScaler;

    private var _walkPathLines:Vector.<Line> = new Vector.<Line>();
    private var _walkMapLines:Vector.<Line> = new Vector.<Line>();

    public function drawPath(path:Path):void {
        clear(_walkPathLines);
        if (path.waypoints.length > 0) {
            for (var i:int = 1; i < path.waypoints.length; i++) {
                var line:Line = new Line();
                line.lineTo(path.waypoints[i].point.x - path.waypoints[i - 1].point.x, path.waypoints[i].point.y - path.waypoints[i - 1].point.y);
                line.x = path.waypoints[i - 1].point.x;
                line.y = path.waypoints[i - 1].point.y;
                line.thickness = 3;
                addChild(line);
                _walkPathLines.push(line);
            }
        }
    }

    public function drawWalkMap(walkMap:Vector.<Box>):void {
        clear(_walkMapLines);
        if (walkMap) {
            for each (var box:Box in walkMap) {
                drawWalkBox(box);
            }
        }

    }

    private function drawWalkBox(box:Box):void {
        var sortedVertexes:Vector.<BoxVertex> = box.clockwiseSortedVertexes;
        for (var i:int = 0; i < sortedVertexes.length; i ++) {
            var vertex:BoxVertex = sortedVertexes[i];
            var prevVertex:BoxVertex = (i == 0) ? sortedVertexes[sortedVertexes.length - 1] : sortedVertexes[i-1];
            var line:Line = new Line();
            line.lineTo(vertex.x - prevVertex.x, vertex.y - prevVertex.y);
            line.x = prevVertex.x;
            line.y = prevVertex.y;
            line.thickness = 3;
            line.color = 0xffffff;
            addChild(line);
            _walkMapLines.push(line);
        }
    }

    private function clear(lines:Vector.<Line>):void {
        for each (var line:Line in lines) {
            if (contains(line)) {
                removeChild(line);
            }
        }
        lines.length = 0;
    }


}
}