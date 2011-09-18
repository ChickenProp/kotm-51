package {

import net.flashpunk.*;
import net.flashpunk.utils.*;

public class Snake extends Entity {
	public var speed:Number = 5;
	public var locs:Vector.<vec> = new Vector.<vec>();
	public var maxLength:Number = 20;
	public var radius:Number = 1;

	public function get head () : vec {
		return locs[locs.length - 1];
	}

	public function Snake (_x:Number, _y:Number) {
		locs.push(new vec(_x, _y));
	}

	override public function update () : void {
		var target:vec = new vec(Input.mouseX, Input.mouseY);
		var dir:vec = target.sub(head).normalize();
		var dist:Number = target.sub(head).length;
		var newhead:vec = head.add(dir.mul(Math.min(speed, dist)));
		locs.push(newhead);
		while (locs.length > maxLength)
			locs.shift();
		super.update();
	}

	override public function render () : void {
		for (var i:int = 0; i < locs.length-1; i++) {
			var p1:vec = locs[i];
			var p2:vec = locs[i+1];
			Draw.linePlus(p1.x, p1.y, p2.x, p2.y, 0xFF0000, 1, radius*2);
		}
		var h:vec = locs[locs.length - 1];
		Draw.linePlus(h.x, h.y, h.x, h.y, 0xFFFFFF, 1, radius*2);
	}
}

}
