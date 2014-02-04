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
					b.angle += 0.02;
				}
			});
		
			var charge:Script = repeat(2, function():void {
				if (spin.length >= dens) {
					charge.remove();
					return;
				}
				spin.push(spawn((2*Math.PI)/(dens+1)*spin.length-angle));
				b = spin[spin.length - 1];
				b.oobscript.remove();
				b.defcolor = color;
				b.defblend = "normal";
				b.defalpha = 0.2;
			});
			charge.remove();
			
			var deploy:Script = repeat(30, function():void {
				var tgt:OrbiterCatcher = target as OrbiterCatcher;
			
				if (spin.length == 0) {
					deploy.remove();
					return;
				}
				if (/*!tgt.catching()*/ tgt.spin.length>=tgt.dens) {
					return;
				}
				
				b = spin[spin.length - 1];
				b.aim(target);
				b.dir(2.8);
				delay(50, b.oobscript.add);
				spin.splice(spin.length-1, 1);
			});
			deploy.remove();
			
			var startcharge:ScriptDelay = delay(120, charge.add);
			startcharge.remove();
			var startdeploy:ScriptDelay = delay(80, deploy.add);
			startdeploy.remove();
			
			delay(5, function():void {
				var tgt:OrbiterCatcher = target as OrbiterCatcher;
			
				whenever(function():Boolean { 
					return tgt.spin.length == 0 && spin.length>=dens;
				}, function():void {
					if (has_script(startdeploy) || has_script(deploy)) return;
					host.track.announce("feed");
					startdeploy.delay = 80;
					startdeploy.add();
				});
				whenever(function():Boolean { 
					return spin.length == 0 && tgt.spin.length==0;
				}, function():void {
					if (has_script(startcharge) || has_script(charge)) return;
					host.track.announce("charge");
					startcharge.delay = 120;
					startcharge.add();
				});
			});
		}
	}
	
}