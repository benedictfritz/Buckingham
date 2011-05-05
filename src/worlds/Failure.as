package worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class Failure extends World
	{
		
		[Embed(source = '../assets/buckinghamface.png')]
		private const FACE:Class;
		private var _time:Number;
		private var _day:Number;
		
		public function Failure(day:Number)
		{
			_day = ++day;
			var top:Text = new Text("Today", 230, 5);
			top.scale = 3;
			addGraphic(top);
			
			var bottom:Text = new Text("Today is not my day", 60, 420);
			bottom.scale = 3;
			addGraphic(bottom);
			addGraphic(new Image(FACE));
			
			_time = 0;
		}
		
		override public function update():void
		{
			_time += FP.elapsed;
			if (_time > 5)
				FP.world = new Town(_day);
		}
		
	}

}