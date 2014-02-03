package bullets
{
	public class BulletAttack2 extends BulletArena
	{
		public function BulletAttack2() {
			track.report("002 WEIGHT OF HISTORY");
		}
		
		override public function spawn():void {
			add(new HelixEnemy(this, 40, -60));
			add(new HelixEnemy(this, track.scr_w-40, -60));
		}
		
		override public function next():BulletArena {
			return new BulletAttack3();
		}
	}
	
}