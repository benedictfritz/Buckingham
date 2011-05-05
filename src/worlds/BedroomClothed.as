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
	
	public class BedroomClothed extends World
	{
		[Embed(source = '../assets/bedroom.png')]
		private const BEDBUCKY:Class;
		
		private var sprBucky:Spritemap = new Spritemap(BEDBUCKY, 640, 480);
		private static var top:Text;
		private static var bottom:Text;
		
		public function BedroomClothed()
		{
			sprBucky.add("clothed", [1], 1, true);
			addGraphic(sprBucky);
			sprBucky.play("clothed");
			
			top = new Text("They will know who I am.", 0, 80);
			top.scale = 3;
			addGraphic(top);
			
			bottom = new Text("I will teach them.", 115, 300);
			bottom.scale = 3;
			addGraphic(bottom);
			
			var instructions:Text = new Text("With my waterballoons.", 35, 360);
			instructions.scale = 3;
			addGraphic(instructions);

		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
			{
				FP.world = new Town(1);
			}
		}
		
	}

}