package {

import net.flashpunk.*;
import net.flashpunk.graphics.*;

public class Nomable extends Entity {
	public function get pos () : vec { return new vec(x, y); }
	public function set pos (v:vec) : void { x = v.x; y = v.y; }

	public var radius:Number = 3;
	
	public function Nomable () {
		x = FP.rand(380) + 10;
		y = FP.rand(380) + 10;

		graphic = Image.createCircle(radius, 0xFFFFFF);

		type = "nomable";
	}

	override public function update () : void {
		var player:Snake = (world as Game).player;
		var head:vec = player.head;
		var fear:Number = 100 / head.sub(pos).lengthSquared();
		fear = Math.min(fear, 10);

		var target:vec = pos.add(pos.sub(head).normalize().mul(fear));

		for (var i:int = 0; i < player.locs.length - 1; i++) {
			var s1:vec = player.locs[i];
			var s2:vec = player.locs[i+1];
			if (vec.intersecting(s1, s2, pos, target,
			                     radius+player.radius))
			{
				world.remove(this);
				player.maxLength += 10;
				world.add(new Nomable());
				break;
			}
		}
		
		pos = target;
	}
}

}



