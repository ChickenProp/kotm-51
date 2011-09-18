package {

import net.flashpunk.*;

public class Game extends World {
	public var player:Snake = null;
	public var noms:Array = [];

	public function Game () {
		player = new Snake(200, 200);
		add(player);
		add(new Nomable);
		add(new Nomable);
		add(new Nomable);
		add(new Nomable);
	}
}
}
