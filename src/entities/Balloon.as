package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class Balloon extends Entity
	{
		[Embed(source = '../assets/balloon.png')]
		private const BALLOON:Class;
		
		private var sprBalloon:Spritemap = new Spritemap(BALLOON, 15, 15);
		
		private var sineWavPos:Number;
		private var fallSpeed:Number;
		private var maxHeight:Number;
		private var sineWavSpeed:Number;
		private var xDir:Number;
		
		public function Balloon() 
		{
			sprBalloon.add("default", [0], 1, true);
			sprBalloon.add("burst", [1, 2, 3], 20, false);
			graphic = sprBalloon;
			
			sineWavPos = 0;
			sineWavSpeed = 5;
			fallSpeed = 200;
			maxHeight = 40;
			type = "balloon";
			
			setHitbox(15, 15);
		}
				
		public function init(x:Number, y:Number, direction:String):void
		{
			if (direction == "right")
				xDir = 10;
			else if (direction == "left")
				xDir = -10;
			else
				xDir = 0;
				
			this.x = x;
			this.y = y+20;
		}
		
		override public function update():void
		{		
			x += xDir;
			
			var lastHeight:Number = sineWavPos;
			sineWavPos += sineWavSpeed * FP.elapsed;
			if (sineWavPos > Math.PI)
				y += fallSpeed * FP.elapsed;
			else
				y -= (Math.sin(sineWavPos) - Math.sin(lastHeight)) * maxHeight;
				
			if (sprBalloon.currentAnim == "burst" && sprBalloon.complete)
			{
				world.recycle(this);
				return;
			}
			
			if (!onCamera)
			{
				world.recycle(this);
				return;
			}
				
			if (collide("legs", x, y))
				sprBalloon.play("burst");
			else
				sprBalloon.play("default");
		}
	}

}