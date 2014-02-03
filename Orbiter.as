package bullets
{
	public class Orbiter extends Enemy
	{
		public var range:int;
		public var dens:int;
		public var target:Gentity;
		public var colorflag:int;
		public var explode:Function;
		
		public function Orbiter(_host:GenWorld, _x:Number, _y:Number, _range:int, _dens:int, _target:Gentity, _colorflag:int=-1) {
			range = _range; dens = _dens; target = _target; colorflag = _colorflag;
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			oncollision("player", function():void {
				img.color = 0x80C0A0;
			});
			
			var b:Bullet;
			var spin:Array = [];
			for (var i:int = 0; i < dens; i++) {
				spin.push(spawn(torad(360/dens*i)));
				b = spin[spin.length-1] as Bullet;
				b.oobscript.remove();
				if (colorflag != -1) {
					b.defblend = "normal"
					b.defalpha = 0.2;
					b.defcolor = colorflag;
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
			
			//delay(300, function():void {
			//oncollision("laser", function():void {
				//repeat(0, function():void {
				
				explode = function():void { 
					borbit.remove();
					delay(250, function():void {
					//repeat(1, function():void {
						if (spin.length == 0) return;
						
						var get_target:Function;
						if (target) get_target = function():Gentity { return target; }
						else get_target = function():Gentity { return player(); }
						
						i = 0;
						while (spin.length) {
							b = spin[0] as Bullet;
							delay(50, b.oobscript.add);
							b.aim(get_target());
							b.dir(0.4+(i%5)*0.1);
							spin.splice(0, 1);
							i++;
						}
					//});
					});
				}
			//});
		}
	}
	
}