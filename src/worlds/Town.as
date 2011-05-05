package worlds 
{
	import entities.*;
	import net.flashpunk.World;
	
	public class Town extends World
	{
		private var _background:Background;
		
		public function Town(day:Number) 
		{
			_background = new Background(day);
			add(_background);
			
			var bucky:Buckingham = new Buckingham;
			bucky.init(320, 375);
			add(bucky);
			
			var legs:Legs = new Legs(true);
			add(legs);
		}
		
		public function stopTime():void
		{
			_background.stopTime();
		}
	}

}