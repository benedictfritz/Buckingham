package worlds 
{
	import entities.Buckingham;
	import entities.Legs;
	import flash.events.TextEvent;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class BedroomNaked extends World
	{
		[Embed(source = '../assets/bedroom.png')]
		private const BEDBUCKY:Class;
		
		private var sprBucky:Spritemap = new Spritemap(BEDBUCKY, 640, 480);
		private static var top:Text;
		private static var bottom:Text;
		private static var instructions:Text;
		
		public function BedroomNaked()
		{
			sprBucky.add("naked", [0], 1, true);

			addGraphic(sprBucky);
			sprBucky.play("naked");
			
			top = new Text("Today.", 250, 80);
			top.scale = 3;
			addGraphic(top);
			
			bottom = new Text("Today is the day.", 120, 290);
			bottom.scale = 3;
			addGraphic(bottom);
			
			/*
			instructions = new Text("[space] - continue", 165, 415);
			instructions.scale = 2;
			addGraphic(instructions);
			*/

		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
			{
				FP.world = new BedroomClothed;
			}
		}
		
	}

}