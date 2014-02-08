package bullets
{
	public class BulletAttack8 extends BulletArena
	{
		public function BulletAttack8() {
			track.report("008 MATTER AND ANTIMATTER");
		}
		
		override public function spawn():void {
			add(new MatterFlower(this, track.scr_w/2, track.scr_h/2-40));
			add(new AntiMatterFlower(this, track.scr_w/2, track.scr_h/2+80));
		}
		
		override public function next():BulletArena {
			return new BulletAttack8();
		}
	}
	
}