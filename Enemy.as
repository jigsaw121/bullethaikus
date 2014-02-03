package bullets
{
	public class Enemy extends Gentity 
	{
		public function Enemy(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		public function rescript():void {
			scripts = [];
			scriptinit();
		}
		
		public function spawn(_angle:Number):Bullet {
			return host.add(new Bullet(host, x, y, _angle)) as Bullet;
		}
		
		public function orbitx(_angle:Number, dist:Number):Number {
			return x + Math.cos(_angle) * dist;
		}
		
		public function orbity(_angle:Number, dist:Number):Number {
			return y + Math.sin(_angle) * dist;
		}
		
		public function player():BulletHellPlayer {
			return (host as BulletArena).player;
		}
		
		override public function sizeinit():void {
			width = 8; height = 8;
		}
	}
	
}