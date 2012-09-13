package me.pa3.quest.utils {
	import me.pa3.quest.vos.Box;
	import me.pa3.quest.vos.Gate;

	/**
	 * Object which finds route between two boxes in box-map.
	 * Also it knows if two given boxes are neighbours, and if so, could return Gate object, which
	 * in turn represents line of contact of that two boxes.
	 */
	public class BoxNavigator {

	    private var boxes:Vector.<Box>;
	    private var nextBoxMap:TwoKeysMap;
	    private var gatesMap:TwoKeysMap;

	    public function BoxNavigator(boxes:Vector.<Box>) {
	        this.boxes = boxes;
	        rebuildRoutes();
	        rebuildGatesMap();
	    }

	    public function haveRoute(from:Box, to:Box):Boolean {
	        return nextBoxMap.contains(from,to);
	    }

	    public function nextBoxInRoute(from:Box, to:Box):Box {
	        return nextBoxMap.get(from,to);
	    }

	    public function getGateBetween(box1:Box, box2:Box):Gate {
	        return gatesMap.get(box1, box2);
	    }

	    private void rebuildRoutes() {
	        // Floyd–Warshall algorithm. Check Wikipedia for explanation.
	        // In this realization I am using -1 as an infinity value.

	        TwoKeysMap<Box,Box,Integer> path = new TwoKeysMap<Box, Box, Integer>();
	        nextBoxMap = new TwoKeysMap<Box, Box, Box>();

	        for (int i = 0; i < boxes.size(); i++) {
	            for (int j = 0; j < boxes.size(); j++) {
	                if (i != j) {
	                    boolean iAndJBoxesAreNeighbours = areBoxesNeighbours(boxes.get(i), boxes.get(j));
	                    path.put(boxes.get(i), boxes.get(j), iAndJBoxesAreNeighbours  ? 1 : -1);
	                    if (iAndJBoxesAreNeighbours) {
	                        nextBoxMap.put(boxes.get(i), boxes.get(j), boxes.get(j));
	                    }
	                } else {
	                    path.put(boxes.get(i), boxes.get(i), 0);
	                }
	            }
	        }

	        for (int i = 0; i < boxes.size(); i++) {
	            for (int j = 0; j < boxes.size(); j++) {
	                for (int k = 0; k < boxes.size(); k++) {
	                    Box boxI = boxes.get(i);
	                    Box boxJ = boxes.get(j);
	                    Box boxK = boxes.get(k);
	                    int ijPathLength = path.get(boxI, boxJ);
	                    int ikPathLength = path.get(boxI, boxK);
	                    int kjPathLength = path.get(boxK, boxJ);
	                    if (ijPathLength == -1 && (ikPathLength != -1 && kjPathLength != -1)) {
	                        path.put(boxI, boxJ, ikPathLength + kjPathLength);
	                        nextBoxMap.put(boxI, boxJ, nextBoxMap.get(boxI, boxK));
	                    } else if (ijPathLength != -1 && ikPathLength != -1 && kjPathLength != -1) {
	                        if (ikPathLength + kjPathLength < ijPathLength) {
	                            path.put(boxI, boxJ, ikPathLength + kjPathLength);
	                            nextBoxMap.put(boxI, boxJ, nextBoxMap.get(boxI, boxK));
	                        }
	                    }
	                }
	            }
	        }


	    }


	    private void rebuildGatesMap() {
	        gatesMap = new TwoKeysMap<Box, Box, Gate>();
	        for (Box box1 : boxes) {
	            for (Box box2 : boxes) {
	                if (box1 != box2) {
	                    gatesMap.put(box1, box2, getGateBetweenBoxes(box1, box2));
	                }
	            }
	        }
	    }

	    private boolean areBoxesNeighbours(Box a, Box b) {
	        return getGateBetweenBoxes(a,b) != null;
	    }

	    private Gate getGateBetweenBoxes(Box a, Box b) {
	        // A's upper bound and B's lower bound are on the same line
	        if (a.ul().y == a.ur().y && b.ll().y == b.lr().y && a.ul().y == b.ll().y) {
	            if (a.ur().x > b.ll().x && a.ul().x < b.lr().x) {
	                return new HorizontalGate(
	                        new Vector2f(Math.max(a.ul().x, b.ll().x), a.ul().y),
	                        new Vector2f(Math.min(a.ur().x, b.lr().x), a.ul().y)
	                );
	            }
	        }

	        // A's lower bound and B's upper bound are on the same line
	        if (a.ll().y == a.lr().y && b.ul().y == b.ur().y && a.ll().y == b.ul().y) {
	            if (a.lr().x > b.ul().x && a.ll().x < b.ur().x) {
	                return new HorizontalGate(
	                        new Vector2f(Math.max(a.ll().x, b.ul().x), a.ll().y),
	                        new Vector2f(Math.min(a.lr().x, b.ur().x), a.ll().y)
	                );
	            }
	        }

	        // A's right bound and B's left bound are on the same line
	        if (a.ur().x == a.lr().x && b.ul().x == b.ll().x && a.ur().x == b.ul().x) {
	            if (a.ur().y < b.ll().y && a.lr().y > b.ul().y) {
	                return new VerticalGate(
	                        new Vector2f(a.ur().x, Math.max(a.ur().y, b.ul().y)),
	                        new Vector2f(a.ur().x, Math.min(a.lr().y, b.ll().y))
	                );
	            }
	        }

	        // A's left bound and B's right bound are on the same line
	        if (a.ul().x == a.ll().x && b.ur().x == b.lr().x && a.ul().x == b.ur().x) {
	            if (a.ul().y < b.lr().y && a.ll().y > b.ur().y) {
	                return new VerticalGate(
	                        new Vector2f(a.ul().x, (int)(Math.max(a.ul().y, b.ur().y))),
	                        new Vector2f(a.ul().x, (int)(Math.min(a.ll().y, b.lr().y)))
	                );
	            }
	        }

	        return null;
	    }
}
