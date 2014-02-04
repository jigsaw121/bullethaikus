package bullets
{
	public class BulletAttack4 extends BulletArena
	{
		public function BulletAttack4() {
			track.report("004 PERPETUAL MOTION MACHINE");
			player.y += 16;
		}
		
		override public function spawn():void {
			var orbits:Array = [];
			orbits.push(add(new OrbiterCatcher(this, track.scr_w/2, track.scr_h/2, 48, 52)));
			var mid:Orbiter = orbits[0] as Orbiter;
			
			var spinner:Orbiter;

			var spin:Array = [];
			var color:int;
			for (var i:int = 0; i < 6; i++) 
			{
				color = i%2 ? 0x40A040 : 0xF04040;
				spin.push(add(new OrbiterShooter(this, track.scr_w/2, track.scr_h/2, 48, 32, color)));
				spinner = spin[spin.length-1] as Orbiter;
				spinner.target = mid;
				spinner.angle = (2*Math.PI)/6*i;
				orbits.push(spinner);
			}
			
			var dist:Number;
			var orbitsc:Script = mid.always(function():void {
				dist = 140;
				for (i = 0; i < 6; i++) {
					spinner = spin[i] as Orbiter;
					spinner.x = mid.orbitx(spinner.angle, dist);
					spinner.y = mid.orbity(spinner.angle, dist);
					spinner.angle -= 0.0025;
				}
			});
		}
		
		override public function next():BulletArena {
			return new BulletAttack4();
		}
	}
	
}