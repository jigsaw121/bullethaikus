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
				spin.push(spawn((2*Math.PI)/dens*spin.length-angle));
				spin[spin.length-1].oobscript.remove();
			});
			
			var deploy:Script = repeat(40, function():void {
				var tgt:OrbiterCatcher = target as OrbiterCatcher;
			
				if (/*!tgt.catching()*/ tgt.spin.length>=tgt.dens || spin.length==0) {
					deploy.remove();
					return;
				}
				
				spin[spin.length-1].aim(target);
				spin[spin.length-1].dir(2.5);
				spin.splice(spin.length-1, 1);
			});
			deploy.remove();
			
			delay(40, function():void {
				var tgt:OrbiterCatcher = target as OrbiterCatcher;
			
				whenever(function():Boolean { 
					return tgt.spin.length == 0 && !has_script(charge) 
				}, charge.add);
			});
		}
	}
	
}