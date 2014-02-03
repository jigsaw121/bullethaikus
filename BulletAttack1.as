package bullets
{
	public class BulletAttack1 extends BulletArena
	{
		public function BulletAttack1() {
			player.y = track.scr_h/2;
			track.report("001 AUTUMN RAINING DOWN");
		}
		
		override public function spawn():void {
			var spawner:Enemy = add(new Enemy(this, track.scr_w/2, track.scr_h/2)) as Enemy;
			
			spawner.repeat(18, function():void {
				add(new Leaf(spawner.host, spawner.x, spawner.y, spawner.torad(track.frame)));
			});
			spawner.clear_images();
		}
		
		override public function next():BulletArena {
			return new BulletAttack2();
		}
	}
	
}