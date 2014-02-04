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
			
			var borbit:Script = always(function():void {
				for (var i:int = 0; i < spin.length; i++) {
					b = spin[i] as Bullet;
					b.x = orbitx(b.angle, range);
					b.y = orbity(b.angle, range);
					b.angle += 0.003;
				}
			});
			
			var deploy:ScriptPeriodic = repeat(5, function():void {
				if (spin.length == 0) {
					deploy.remove();
					delay(40, catchsc.add);
					return;
				}
								
				b = spin[0] as Bullet;
				b.angle += Math.PI/2;
				b.dir(2.0);
				spin.splice(0, 1);
			});
			deploy.remove();
			
			catchsc = always(function():void {
				if (spin.length >= dens) {
					catchsc.remove();
					delay(150, deploy.add);
					return;
				}
				
				var catchy:Array = []
				host.getType("bullet", catchy);
				for each (b in catchy) {
					if (distanceFrom(b) <= 40) {
						b.die();
						spin.push(spawn(360/dens*spin.length));
						spin[spin.length-1].oobscript.remove();
					}
				}
			});
		}
		
		public function catching():Boolean {
			return has_script(catchsc);
		}
	}
	
}