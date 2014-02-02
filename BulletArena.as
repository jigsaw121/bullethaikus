package bullets
{
	import net.flashpunk.FP;
	public class BulletArena extends GenWorld
	{
		public var player:BulletHellPlayer;
		
		public function BulletArena() {
			player = add(new BulletHellPlayer(this, track.scr_w/2, track.scr_h/2+100)) as BulletHellPlayer;
			track.scr_w = 200; track.scr_h = 320;
			set_bg(0xC0A0A0);
		}
		
		public function set_bg(color:int):void {
			FP.screen.color = color;
		}
		
		public function next():void {
			// trigger next attack by setting FP.world
		}
	}
	
}