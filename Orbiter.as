package bullets
{
	public class Orbiter extends Enemy
	{
		public var range:int;
		public var dens:Number;
		public var target:Gentity;
		public var color:int;
		public var explode:Function;
		public var spin:Array = [];
			
		public function Orbiter(_host:GenWorld, _x:Number, _y:Number, _range:int, _dens:int, _color:int=-1) {
			range = _range; dens = _dens; color = _color;
			target = this;
			super(_host, _x, _y);
		}
		
		public function bulletinit():void {
			var b:Bullet;
			
			for (var i:int = 0; i < dens; i++) {
				spin.push(spawn(torad(360/dens*i)));
				b = spin[spin.length-1] as Bullet;
				
				b.oobscript.remove();
				if (color != -1) {
					b.defblend = "normal"
					b.defalpha = 0.2;
					b.defcolor = color;
				}
			}
			
			var borbit:Script = always(function():void {
				for (i = 0; i < spin.length; i++) {
					b = spin[i] as Bullet;
					b.x = orbitx(b.angle, range);
					b.y = orbity(b.angle, range);
					b.angle += 0.003;
				}
			});
		}
		
		override public function scriptinit():void {
			var b:Bullet;
			
			for (var i:int = 0; i < dens; i++) {
				spin.push(spawn(torad(360/dens*i)));
				b = spin[spin.length-1] as Bullet;
				
				b.oobscript.remove();
				if (color != -1) {
					b.defblend = "normal"
					b.defalpha = 0.2;
					b.defcolor = color;
				}
			}
			
			var borbit:Script = always(function():void {
				for (i = 0; i < spin.length; i++) {
					b = spin[i] as Bullet;
					b.x = orbitx(b.angle, range);
					b.y = orbity(b.angle, range);
					b.angle += 0.003;
				}
			});
			
			oncollision("player", function():void {
				img.color = 0x80C0A0;
			});
			
			explode = function():void { 
				borbit.remove();
				for each (var b:Bullet in spin) {
					b.aim(target);
				}

				delay(250, function():void {
					i = 0;
					while (spin.length) {
						b = spin[0] as Bullet;
						delay(50, b.oobscript.add);
						b.dir(0.5+(i%5)*0.1);

						b.delay(100, function():void {
							// 'this' will refer to the calling script because of closure scope
							// so it's safe to do casts like this, weird as they might look
							(this as Script).target.always(function():void {
								(this as Script).target.dx *= 1.03;
								(this as Script).target.dy *= 1.03;
							});
						});
						
						spin.splice(0, 1);
						i++;
					}
				});
			}
		}
	}
	
}