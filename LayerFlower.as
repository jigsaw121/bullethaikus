package bullets
{
	public class LayerFlower extends Enemy 
	{
		public function LayerFlower(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			var b:Bullet; var radfr:Number;
			repeat(1, function():void {
				radfr = torad(host.track.frame);
				b = spawn(radfr-Math.sin(radfr)*Math.sin(Math.cos(radfr*0.5)*2*Math.PI*2.8)*torad(120));
				b.dir(0.22);
				b.color_img(0xF02000+(host.track.frame*0.5)%256*0x100+(host.track.frame)%256, 0.4);
				//b.always(b.mvmtdecay(1.005));
				//b.oobscript.remove();
				//delay(40, b.oobscript.add);
			});
			delay(60, shout("dance with me"));
			repeat(120, function():void { 
				aim(player()); 
				dir(9);
			});
			always(movex); always(movey);
			always(mvmtdecay(1.06));
			
		}
	}
	
}