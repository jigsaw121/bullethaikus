package bullets
{
	public class BulletAttack1 extends BulletArena
	{
		public function BulletAttack1() {
			player.y = track.scr_h/2;
		}
		
		override public function spawn():void {
			add(new Spawner(this, track.scr_w/2, track.scr_h/2));
		}
	}
	
}