package bullets
{
	public class BulletAttack2 extends BulletArena
	{
		override public function spawn():void {
			add(new Enemy(this, 40, -60));
			add(new Enemy(this, track.scr_w-40, -60));
		}
	}
	
}