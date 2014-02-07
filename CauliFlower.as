package bullets
{
	public class CauliFlower extends Enemy 
	{
		public var own:Array = [];
		
		public function CauliFlower(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			var b:Bullet; var radfr:Number;
			var i:int; var j:Number = 0;
			function spin():Number {
				return 120+torad(host.track.frame)*(torad(host.track.frame)*24);
			};
			repeat(40, function():void {
				var z:Number = spin();
				for (i = z; i < 360+z; i += 18) {
					b = spawn(torad(i+9));
					b.x = x+Math.cos(b.angle) * 250;
					b.y = y+Math.sin(b.angle) * 250;
					b.dir(-0.4);
					b.color_img(0xF00000, 0.4);
					b.oobscript.remove();
				}
			});
			oncollision("bullet", function(hit:Gentity):void {
				hit.die();
			});
			repeat(240, function():void {
				for (i = 0; i < 360; i += 6) {
					b = spawn(torad(i));
					b.dir(1);//+Math.sin(torad(i*6))*0.5
					b.color_img(0xF08080, 0.4);
				}
				for (i = 0; i < 360; i += 6) {
					b = spawn(torad(30+i));
					b.dir(1.5);//+Math.sin(torad(30+i*6))*0.5
					b.color_img(0xF000F0, 0.4);
				}
				
				//j -= Math.PI/4;
			});
			delay(50, function():void {
				repeat(240, function():void {
					var k:Number = 0;
					for (i = 0; i < 360; i += 4) {
						b = spawn(k+torad(30+i));
						b.dir(1+Math.sin(torad((30+i)*6))*0.3);
						b.color_img(0xF0F030, 0.4);
						b.ondeath = function(g:Gentity):void {
							var i:int = own.indexOf(g);
							if (i == -1) return;
							own.splice(i, 1);
						}
						k += 0.1;
					}
				})
			})
			/*repeat(160, function():void {
				i = 0;
				for each (b in own) {
					b.aim(own[(i+8)%own.length]);
					b.dir(1.2);
					i++;
				}
			});*/
		}
	}
	
}