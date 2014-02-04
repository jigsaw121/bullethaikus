package bullets
{
	public class OrbiterCatcher extends Orbiter
	{
		public var catchsc:Script;
		
		public function OrbiterCatcher(_host:GenWorld, _x:Number, _y:Number, _range:int, _dens:int, _color:int=-1) {
			super(_host, _x, _y, _range, _dens, _color);
		}
		
		override public function scriptinit():void {
			var b:Bullet;
			
			var bosp:Number = 0.003;
			var borbit:Script = always(function():void {
				for (var i:int = 0; i < spin.length; i++) {
					b = spin[i] as Bullet;
					b.x = orbitx(b.angle, range);
					b.y = orbity(b.angle, range);
					b.angle += bosp;
				}
			});
			
			var deploy:ScriptPeriodic = repeat(4, function():void {
				catchsc.add();
				if (spin.length == 0) {
					deploy.remove();
					return;
				}
				//bosp += 0.001;
								
				b = spin[0] as Bullet;
				b.angle -= Math.PI/2;
				b.adjust_angle(b.img);
				b.dir(2.0);
				spin.splice(0, 1);
				b.oobscript.add();
			});
			deploy.remove();
			
			var startdeploy:ScriptDelay = delay(150, deploy.add);
			startdeploy.remove();
			var j:int = 0;
			catchsc = always(function():void {
				if (spin.length >= dens) {
					if (has_script(startdeploy) || has_script(deploy)) return;
					catchsc.remove();
					startdeploy.delay = 150;
					startdeploy.add();
					host.track.announce("deploy");
					return;
				}
				
				b = collide("bullet", x, y) as Bullet;
				if (b) {
					b.die();
					spin.push(spawn((180/(dens+1))*j));
					spin[spin.length-1].oobscript.remove();
					j++;
				}
			});
		}
		
		public function catching():Boolean {
			return has_script(catchsc);
		}
	}
	
}