package bullets
{
	public class HelixEnemy extends Enemy
	{
		public function HelixEnemy(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			var b:Bullet;
			
			dy = 4;
			always(movex); always(movey);
			
			var trails:Array = []
			var trail:Script = always(function():void {
				if (y < 0) return;
				
				b = spawn(0); trails.push(b);
				b.x = orbitx(torad(host.track.frame*32), 18);
				b.defcolor = 0xF04020;
				b.defblend = "normal";
				b.defalpha = 0.2;
				
				b = spawn(0); trails.push(b);
				b.x = orbitx(torad(host.track.frame*32+180), 18);
				b.defcolor = 0x20C0F0;
				b.defblend = "normal";
				b.defalpha = 0.2;
			});

			//var slow:Script = always(function():void { dy -= 0.2; });
			when(function():Boolean { return y >= 80; }, 
			function():void {
				dy = 0; 
				//slow.remove(); 
				trail.remove();
				shoot();
			});
			
			var shoot:Function = function():void {
				repeat(3, function():void {
					b = spawn(Math.PI/2.0 + Math.sin(torad(host.track.frame*6) * Math.PI/2.0));
					b.dir(1.5);
				});
			}
			
			function fadeout():void {
				when(oob, function():void {
					delay(100, function():void {
						die();
						duplicate(x, -60);
					});
				});
			}
			
			delay(300, function():void {
				var aimb:Script = repeat(18, function():void {
					b = trails.pop() as Bullet;
					b.aim(player());
					b.dir(2.0);
					b.flash();
				});
				when(function():Boolean { return trails.length == 0 }, function():void {
					aimb.remove();
					delay(300, function():void {
						dy = 4;
						fadeout();
					});
				});
			});
		}
	}
	
}