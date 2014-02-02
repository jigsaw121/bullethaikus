package bullets
{
	public class Spawner extends Gentity
	{
		public function Spawner(_host:GenWorld,_x:Number,_y:Number) {
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			repeat(18, function():void {
				host.add(new Leaf(host, x, y, torad(host.track.frame)));
			});
		}
		
		override public function imginit():void {
			// doesn't need an image - it's just a point that spawns things
		}
	}
	
}