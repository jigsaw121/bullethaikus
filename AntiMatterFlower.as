package bullets
{
	public class AntiMatterFlower extends Enemy 
	{
		public function AntiMatterFlower(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function spawn(_angle:Number):Bullet {
			return host.add(new AntiMatterBullet(host, x, y, _angle)) as Bullet;
		}
		
		override public function scriptinit():void {
			var b:Bullet; var radfr:Number;
			repeat(0, function():void {
				radfr = torad(host.track.frame);
				b = spawn(radfr+Math.sin(radfr*2.8)*Math.PI*2);
				b.dir(1);
			});
			repeat(4, function():void {
				radfr = torad(20+host.track.frame*0.3);
				b = spawn(radfr);
				b.dir(1);

				b = spawn(radfr+Math.PI);
				b.dir(1);
			});
		}
	}
	
}