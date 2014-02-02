package bullets
{
	public class BulletAttack2 extends BulletArena
	{
		override public function spawn():void {
			add(new HelixEnemy(this, 40, -60));
			add(new HelixEnemy(this, track.scr_w-40, -60));
		}
	}
	
}