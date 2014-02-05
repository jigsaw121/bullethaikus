package bullets
{
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Gentity
	{
		[Embed(source = "img/bullet.png")] private const BULLET_IMG:Class;
		public var defcolor:int;
		public var defblend:String;
		public var defalpha:Number;
		
		// in case some other entity wants to remove this script
		public var oobscript:ScriptTrigger;
		
		public function Bullet(_host:GenWorld,_x:Number,_y:Number,_angle:Number):void {
			angle = _angle;
			super(_host, _x, _y);
			defcolor = 0xC0C080;
			defblend = "lighten";
			defalpha = 1.0;
			flash();
		}
		
		public function flash():void {
			img.blend = "add";
			img.color = 0x20A060;
			img.alpha = 1;
			
			delay(14, function():void { 
				img.color = defcolor; 
				img.blend = defblend; 
				img.alpha = defalpha; 
			});
		}
		
		public function color_img(_color:int, _alpha:Number):void {
			// a quick way for hosts to change the color
			defcolor = _color;
			defblend = "normal";
			defalpha = _alpha;
		}
		
		override public function scriptinit():void {
			always(movex); always(movey);
			
			// only the visibly spawned ones will threaten the player
			oobscript = when(oob, die);
		}
		override public function sizeinit():void {
			width = 4; height = 4;
		}
		override public function typeinit():void {
			type = "bullet";
		}
		override public function imginit():void {
			make_img(new Image(BULLET_IMG));
			adjust_angle(img);
			
			// additional graphic to highlight hitbox
			var hitbox:Image = addGraphic(Image.createRect(width,height,0xD8D8B8)) as Image;
			hitbox.blend = "lighten";
		}
	}
	
}