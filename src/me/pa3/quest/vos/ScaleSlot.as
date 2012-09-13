package me.pa3.quest.vos {
	public class ScaleSlot {
	    public var y1:Number;
	    public var scale1:Number;
	    public var y2:Number;
	    public var scale2:Number;

	    public function ScaleSlot(y1:Number, scale1:Number, y2:Number, scale2:Number) {
	        this.y1 = y1;
	        this.scale1 = scale1;
	        this.y2 = y2;
	        this.scale2 = scale2;
	    }

	    public function getScaleAt(y:Number):Number {
	        if (y < y1) {
	            return scale1;
	        } else if (y > y2) {
	            return scale2;
	        } else  {
	            return scale1 + (scale2 - scale1) * (y - y1) / (y2- y1);
	        }

	    }
	}

}
