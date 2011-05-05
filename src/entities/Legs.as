package entities 
{
	import flash.display.Sprite;
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	
	import worlds.Town;
	
	public class Legs extends Entity
	{		
		[Embed(source = '../assets/redright.png')]
		private const REDRIGHT:Class;
		[Embed(source = '../assets/redleft.png')]
		private const REDLEFT:Class;
		
		[Embed(source = '../assets/greenright.png')]
		private const GREENRIGHT:Class;
		[Embed(source = '../assets/greenleft.png')]
		private const GREENLEFT:Class;
		
		[Embed(source = '../assets/orangeright.png')]
		private const ORANGERIGHT:Class;
		[Embed(source = '../assets/orangeleft.png')]
		private const ORANGELEFT:Class;
	
		private var sprLegs:Spritemap;
		private var _right:Boolean;
		private var _violent:Boolean;
		private var _prevViolent:Boolean;
		
		private var _talking:Boolean;
		private var _talkingTime:Number;
		
		private var _speech:Text;
		
		private var _success:Boolean;
		private var _color:String;
		
		public function Legs(prevViolent:Boolean) 
		{
			var rand:uint = FP.rand(6);
			_prevViolent = prevViolent;
			_violent = false;
			_talking = false;
			_talkingTime = 0;
			_success = false;
			
			switch(rand) {
				case 0:
					_right = true;
					_color = "red";
					sprLegs = new Spritemap(REDRIGHT, 220, 500);
					break;
				case 1:
					_right = false;
					_color = "red";
					sprLegs = new Spritemap(REDLEFT, 220, 500);
					break;
				case 2:
					_right = true;
					_color = "green";
					sprLegs = new Spritemap(GREENRIGHT, 220, 500);
					break;
				case 3:
					_right = false;
					_color = "green";
					sprLegs = new Spritemap(GREENLEFT, 220, 500);
					break;
				case 4:
					_right = true;
					_color = "orange";
					sprLegs = new Spritemap(ORANGERIGHT, 220, 500);
					break;
				case 5:
					_right = false;
					_color = "orange";
					sprLegs = new Spritemap(ORANGELEFT, 220, 500);
					break;
			}
			
			if (_right)
			{
				sprLegs.add("walk", [0, 1, 2, 3, 4, 5, 6, 7], 6, true);
				sprLegs.add("stand", [8], 6, true);
				x = 0 - sprLegs.width;
			}
			else
			{
				sprLegs.add("walk", [8, 7, 6, 5, 4, 3, 2, 1], 6, true);
				sprLegs.add("stand", [0], 6, true);
				x = FP.screen.width + sprLegs.width;
			}
			
			y = -40;
				
			graphic = sprLegs;
			setHitbox(180, 500);
			type = "legs";
		}
		
		override public function update():void
		{
			if (_success)
				return;
			
			if ( (_right && x > (FP.screen.width + sprLegs.width)) || (!_right && x < (0 - sprLegs.width)) )
			{
				var newLegs:Legs = new Legs(_violent);
				world.add(newLegs);
				world.recycle(this);
				return;
			}
			
			if ( ((_right && x > (FP.screen.width / 2)) || 
				(!_right && x < (FP.screen.width / 2)) ) && (!_prevViolent && !_violent))
			{
				sprLegs.play("stand");
				_success = true;
				world.add(new Head(x, _right, _color));
				((Town)(world)).stopTime();
				return;
			}
			
			if (_talking)
			{
				_talkingTime -= FP.elapsed;
				if (_talkingTime < 0)
				{
					_talking = false;
					_speech.visible = false;
				}
				
				sprLegs.play("stand");
			}
			else 
			{
				if (collide("balloon", x, y))
				{
					_violent = true;
					_talking = true;
					// pause and talk for 2 seconds
					_talkingTime = 2;
					sprLegs.play("stand");
					
					if(x > (FP.screen.width / 2))
						_speech = new Text(randSpeech(), x - 150, 20);
					else
						_speech = new Text(randSpeech(), x + 150, 20);
					_speech.color = 0xFF0000;
					world.addGraphic(_speech);
				}
				else 
				{
					sprLegs.play("walk");
					
					if(_right)
						x += 4;
					else
						x -= 4;
				}
			}
		}
		
		private static function randSpeech():String
		{
			var rand:uint = FP.rand(7);
			switch(rand)
			{
				case 0:
					return "These will take forever to dry!";
				case 1: 
					return "Is it raining now?";
				case 2:
					return "Where did that come from?";
				case 3:
					return "It looks like I peed myself!";
				case 4:
					return "Now I have to go change!";
				case 5:
					return "Did I drool on myself?";
				case 6:
					return "My pants are soaking wet!";
			}
			
			// keep the compiler happy
			return "";
		}
	}

}