package bullets
{
	public class AntiMatterBullet extends Bullet
	{
		public function AntiMatterBullet(_host:GenWorld,_x:Number,_y:Number,_angle:Number):void {
			super(_host, _x, _y, _angle);
			defcolor = 0x202080;
			defblend = "normal";
			defalpha = 0.8;
		}
		override public function typeinit():void {
			type = "antimatter";
		}
		override public function scriptinit():void {
			always(movex); always(movey);
			always(function():void {
				life++;
			});
			
			// only the visibly spawned ones will threaten the player
			oobscript = when(oob, die);
			
			oncollision("bullet", function(hit:Gentity) {
				hit.die()
				die();
			})
		}
	}
	
}