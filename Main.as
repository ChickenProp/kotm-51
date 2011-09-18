package {
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;
import flash.events.*;

[SWF(width = "400", height = "400")]

public class Main extends Engine {

        public function Main () {
                super(400, 400, 60, true);
                Data.load("philh-kotm51-data");
		FP.console.enable();
        }

        override public function init():void {
                FP.world = new Game;
        }
}
}
