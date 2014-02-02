package bullets
{
	import net.flashpunk.graphics.Image;
	
	public class Leaf extends Gentity
	{
		[Embed(source = "img/leaf.png")] private const LEAF_IMG:Class;
		
		public function Leaf(_host:GenWorld,_x:Number,_y:Number,_angle:Number):void {
			angle = _angle;
			super(_host, _x, _y);
			dir(1.5);
		}
		
		override public function scriptinit():void {
			always(movex); always(movey);
			
			add_script(new ScriptRotate(4.0));
			add_script(new ScriptScale(0.02));
			
			delay(28, function():void { 
				// green tint
				always(function():void { img.color += 0x100; });
			});
			
			delay(80, function():void {
				// spawn some bullets
				for (var i:int = 0; i < 24; i++) {
					var lf:Bullet = new Bullet(host,x,y,torad(angle+90+360/12*i));
					host.add(lf);
					// bullet speed ranges from 6/18=1/3 to 30/18=5/3
					lf.dir((i+6)/18.0);
				}
				die();
			});
		}
		
		override public function imginit():void {
			make_img(new Image(LEAF_IMG));
			img.color = 0x8010D0;
			img.blend = "add";
			img.alpha = 0.8;
			adjust_angle(img);
		}
	}
	
}