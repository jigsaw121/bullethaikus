package bullets
{
	public class BulletAttack3 extends BulletArena
	{
		public function BulletAttack3() {
			track.report("003 UNRAVELING THE KNOT");
		}
		
		override public function spawn():void {
			var orbits:Array = [];
			orbits.push(add(new Orbiter(this, track.scr_w/2, track.scr_h/2, 48, 18)));
			var mid:Orbiter = orbits[0] as Orbiter;
			
			var spinner:Orbiter;

			var spin:Array = [];
			var color:int;
			for (var i:int = 0; i < 6; i++) 
			{
				color = i%2 ? 0x40A040 : 0xF04040;
				spin.push(add(new Orbiter(this, track.scr_w/2, track.scr_h/2, 48, 10, color)) as Orbiter);
				spinner = spin[spin.length-1] as Orbiter;
				spinner.angle = (2*Math.PI)/6*i;
				orbits.push(spinner);
			}
			
			var dist:Number;
			var orbitsc:Script = mid.always(function():void {
				dist = 46+Math.sin(0.4*(track.frame*(Math.PI/180.0)))*10;
				for (i = 0; i < 6; i++) {
					spinner = spin[i] as Orbiter;
					spinner.x = mid.orbitx(spinner.angle, dist);
					spinner.y = mid.orbity(spinner.angle, dist);
					spinner.angle -= 0.002;
				}
			});
			
			function allclear():Boolean {
				for each (var o:Orbiter in orbits) {
					if (o.img.color != 0x80C0A0) return false;
				}
				return true;
			}
			
			mid.when(allclear, function():void {
				track.announce("brace yourself");
				orbitsc.remove();
				for each (var o:Orbiter in orbits) {
					o.explode();
				}
			});
			
			mid.when(function():Boolean {
				var buls:Array = [];
				getType("bullet", buls);
				return buls.length == 0;
			}, function():void {
				track.pause();
				track.reset(100);
				track.announce("clear");
			});
		}
		
		override public function next():BulletArena {
			return new BulletAttack4();
		}
	}
	
}