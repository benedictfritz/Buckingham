package entities 
{
	import flash.display.Sprite;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import worlds.Failure;
	
	public class Background extends Entity
	{
		private var _time:Number;
		private var _morning:Boolean;
		private var _stopTime:Boolean;
		
		[Embed(source = '../assets/town.png')]
		private const BACKGROUND:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND1:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND2:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND3:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND4:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND5:Class;
		
		[Embed(source = '../assets/background1.png')]
		private const BACKGROUND6:Class;
		
		[Embed(source = '../assets/backgroundsheet.png')]
		private const BACKGROUNDSHEET:Class;
		
		private var sprBackground:Spritemap = new Spritemap(BACKGROUNDSHEET, 640, 480);
		private var _day:Number;
		private var timeEntity:Entity;
		private var timeText:Text;
		private var _hour:String;
		
		public function Background(day:Number) 
		{	
			_day = day;
			_hour = "6am";
			timeText = new Text("Day " + String(_day) + " Time: " + _hour);
			timeEntity = new Entity(0, 0, timeText);
			
			sprBackground.add("one", [0], 1, true);
			sprBackground.add("two", [1], 1, true);
			sprBackground.add("three", [2], 1, true);
			sprBackground.add("four", [3], 1, true);
			sprBackground.add("five", [4], 1, true);
			sprBackground.add("six", [5], 1, true);
			
			graphic = sprBackground;
			layer = 1;
			_morning = true;
			_time = 0;
			_stopTime = false;
		}
		
		override public function update():void
		{
			world.add(timeEntity);
			
			if (_stopTime)
				return;
				
			timeText.text = "Day " + String(_day) + " Time: " + _hour;
			timeEntity.graphic = timeText;
			
			_time += FP.elapsed;
			
			if (_morning)
			{
				if (_time > 10)
				{
					_hour = "12pm";
					sprBackground.play("six");
					_morning = false;
					return;
				}
				if (_time > 8)
				{
					_hour = "11am";
					sprBackground.play("five");
					return;
				}
				if (_time > 6)
				{
					_hour = "10am";
					sprBackground.play("four");
					return;
				}
				if (_time > 4)
				{
					_hour = "9am";
					sprBackground.play("three");
					return;
				}
				if (_time > 2)
				{
					_hour = "8am";
					sprBackground.play("two");
					graphic.update();
					return;
				}
				if (_time > 0)
				{
					_hour = "7am";
					sprBackground.play("one");
					return;
				}
			}
			else
			{
				if (_time > 20)
				{
					_hour = "5pm";
					sprBackground.play("one");
					_morning = true;
					_time = 0;
					FP.world = new Failure(_day);
					return;
				}
				if (_time > 18)
				{
					_hour = "4pm";
					sprBackground.play("two");
					return;
				}
				if (_time > 16)
				{
					_hour = "3pm";
					sprBackground.play("three");
					return;
				}
				if (_time > 14)
				{
					_hour = "2pm";
					sprBackground.play("four");
					return;
				}
				if (_time > 12)
				{
					_hour = "1pm";
					sprBackground.play("five");
					graphic.update();
					return;
				}
				if (_time > 10)
				{
					_hour = "12pm";
					sprBackground.play("six");
					return;
				}
			}
		}
		
		public function stopTime():void
		{
			_stopTime = true;
		}
		
	}

}