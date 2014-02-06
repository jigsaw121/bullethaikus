package bullets
{
	public class BulletAttack6 extends BulletArena
	{
		public function BulletAttack6() {
			track.report("006 DANCE OF THE MEDUSA");
		}
		
		override public function spawn():void {
			add(new LayerFlower(this, track.scr_w/2, track.scr_h/2-80));
		}
		
		override public function next():BulletArena {
			return new BulletAttack6();
		}
	}
	
}