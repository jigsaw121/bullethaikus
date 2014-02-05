package bullets
{
	public class BulletAttack5 extends BulletArena
	{
		public function BulletAttack5() {
			track.report("005");
		}
		
		override public function spawn():void {
			add(new Flower(this, track.scr_w/2, track.scr_h/2));
		}
		
		override public function next():BulletArena {
			return new BulletAttack5();
		}
	}
	
}