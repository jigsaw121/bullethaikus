package bullets
{
	public class OrbiterShooter extends Orbiter
	{
		public function OrbiterShooter(_host:GenWorld, _x:Number, _y:Number, _range:int, _dens:int, _color:int=-1) {
			super(_host, _x, _y, _range, _dens, _color);
		}
		
		override public function scriptinit():void {
			var b:Bullet;
			
			//bulletinit();
			
			var borbit:Script = always(function():void {
				for (var i:int = 0; i < spin.length; i++) {
					b = spin[i] as Bullet;
					b.x = orbitx(b.angle, range);
					b.y = orbity(b.angle, range);
					//b.angle += 0.003;
				}
			});
		
			var charge:Script = repeat(2, function():void {
				if (spin.length == dens) {
					charge.remove();
					delay(40, deploy.add);
					return;
				}
				spin.push(spawn(360/dens*spin.length));
				spin[spin.length-1].oobscript.remove();
			});
			
			var deploy:Script = repeat(40, function():void {
				var tgt:OrbiterCatcher = target as OrbiterCatcher;
				if (!tgt.catching() || spin.length == 0) {
					deploy.remove();
					delay(40, charge.add);
					return;
				}
				spin[0].aim(target);
				spin[0].dir(1.5);
				spin.splice(0, 1);
			});
			deploy.remove();
			
		}
	}
	
}