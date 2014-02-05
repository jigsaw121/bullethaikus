package bullets
{
	public class Flower extends Enemy 
	{
		public function Flower(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			var b:Bullet; 
			var radfr:Number;
			repeat(0, function():void {
				radfr = torad(host.track.frame);
				b = spawn(radfr+Math.sin(radfr*2.8)*Math.PI*2);
				b.dir(1);
				b.defcolor = 0xF08000+(host.track.frame*2)%256;
				b.defblend = "normal";
				b.defalpha = 0.4;
			});
			repeat(4, function():void {
				radfr = torad(20+host.track.frame*0.3);
				b = spawn(radfr);
				b.dir(1);
				b.defcolor = 0x4080A0;
				b.defblend = "normal";
				b.defalpha = 0.8;

				b = spawn(radfr+Math.PI);
				b.dir(1);
				b.defcolor = 0x4080A0;
				b.defblend = "normal";
				b.defalpha = 0.8;
			});
		}
	}
	
}