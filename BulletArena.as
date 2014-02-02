package bullets
{
	public class BulletArena extends GenWorld
	{
		public var player:BulletHellPlayer;
		
		public function BulletArena() {
			player = add(new BulletHellPlayer(this, track.scr_w/2, track.scr_h/2+100)) as BulletHellPlayer;
		}
		
		public function next():void {
			// trigger next attack by setting FP.world
		}
	}
	
}