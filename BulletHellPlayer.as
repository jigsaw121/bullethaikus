package bullets
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class BulletHellPlayer extends Gentity
	{
		public function BulletHellPlayer(_host:GenWorld,_x:Number,_y:Number) {
			super(_host, _x, _y);
			// draw on top of everything
			layer = -1;
		}
		
		override public function typeinit():void {
			type = "player";
		}
		override public function scriptinit():void {
			var mvmt:ScriptTopdownMovement = add_script(new ScriptTopdownMovementDiscrete(1.0)) as ScriptTopdownMovement;
			/*always(function():void {
				if (Input.check(Key.SHIFT)) mvmt.acc = 2.0;
				else mvmt.acc = 1.0;
			});*/
			
			always(function():void {
				movex(); 
				if (x < 0 || x+width > host.track.scr_w) x -= dx;
			});
			always(function():void {
				movey(); 
				if (y < 0 || y+width > host.track.scr_h) y -= dy;
			});
			
			oncollision("bullet", function(hit:Gentity):void { 
				host.track.pause();
				host.track.reset(100);
				host.track.announce("pichuun~");
				
				var blink:Script = host.track.add_script(new ScriptBlink(8));
				blink.set_target(hit);
			});
			
			write(0, 0, function():String { return host.track.frame.toString(); } )
		}
		override public function sizeinit():void {
			width = 4; height = 4;
		}
		override public function imginit():void {
			add_rectimg(width,height,0xD080C0);
		}
	}
	
}