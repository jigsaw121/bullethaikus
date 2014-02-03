package bullets
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class BulletArena extends GenWorld
	{
		public var player:BulletHellPlayer;
		
		public function BulletArena() {
			track.scr_w = 200; track.scr_h = 320;
			player = add(new BulletHellPlayer(this, track.scr_w/2, track.scr_h/2+100)) as BulletHellPlayer;
			track.when(function():Boolean { return Input.pressed(Key.N); },
			gotonext);
			set_bg(0xC0A0A0);
		}
		
		public function set_bg(color:int):void {
			FP.screen.color = color;
		}
		
		public function gotonext():void {
			FP.world = next();
		}
		public function next():BulletArena {
			// trigger next attack by setting FP.world
			return new BulletArena();
		}
	}
	
}