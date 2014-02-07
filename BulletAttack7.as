package bullets
{
	public class BulletAttack7 extends BulletArena
	{
		public function BulletAttack7() {
			track.report("007 ECOSYSTEM BALANCE");
		}
		
		override public function spawn():void {
			add(new CauliFlower(this, track.scr_w/2, track.scr_h/2-40));
		}
		
		override public function next():BulletArena {
			return new BulletAttack7();
		}
	}
	
}