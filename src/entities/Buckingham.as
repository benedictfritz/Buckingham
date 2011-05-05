package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Buckingham extends Entity
	{
		[Embed(source = '../assets/buckinghamsheet.png')]
		private const BUCKY:Class;
		
		public var sprBucky:Spritemap = new Spritemap(BUCKY, 30, 60);
		private var _speed:Number;
		
		public function Buckingham() 
		{
			sprBucky.add("stand", [0], 5, true);
			sprBucky.add("right", [1, 4, 2, 4, 1, 4, 3, 4], 12, true);
			sprBucky.add("left", [8, 5, 6, 5, 8, 5, 7, 5], 12, true);
			graphic = sprBucky;
			_speed = 150;
		}
		
		public function init(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.SPACE))
			{
				var newBalloon:Balloon = new Balloon;
				if (Input.check(Key.RIGHT))
					newBalloon.init(x, y, "right");
				else if (Input.check(Key.LEFT))
					newBalloon.init(x, y, "left");
				else
					newBalloon.init(x, y, "up");
				world.add(newBalloon);
				
			}
			
			if (Input.check(Key.RIGHT))
			{
				sprBucky.play("right");
				x += _speed * FP.elapsed;
			}
			else if (Input.check(Key.LEFT))
			{
				sprBucky.play("left");
				x -= _speed * FP.elapsed;
			}
			else
			{
				sprBucky.play("stand");
			}
		}
		
	}

}