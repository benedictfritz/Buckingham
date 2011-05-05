package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	import worlds.*;
	
	public class Menu extends World
	{
		private var title:Text;
		private var start:Text;
		
		public function Menu() 
		{
			title = new Text("buckingham", 175, 120);
			title.scale = 3;
			addGraphic(title);
			
			start = new Text("[space] - advance text", 210, 250);
			addGraphic(start);
						
			var arrows:Text = new Text("[arrow keys] - move", 210, 280);
			addGraphic(arrows);
			
			var space:Text = new Text("[space] - throw balloon", 210, 310);
			addGraphic(space);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
				FP.world = new BedroomNaked;
		}
		
	}

}