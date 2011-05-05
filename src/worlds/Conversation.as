package worlds 
{
	import flash.display.Sprite;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Conversation extends World
	{
		[Embed(source = '../assets/redfaces.png')]
		private const REDFACES:Class;
		[Embed(source = '../assets/orangefaces.png')]
		private const ORANGEFACES:Class;
		[Embed(source = '../assets/greenfaces.png')]
		private const GREENFACES:Class;
		
		private var sprHead:Spritemap;
		private var _frame:Number;
		private var _top:Entity;
		private var _bottom:Entity;
		private var _topText:Text;
		private var _bottomText:Text;
		private var _played:Boolean;
		
		public function Conversation(color:String) 
		{
			if (color == "red")
				sprHead = new Spritemap(REDFACES, 640, 480);
			if (color == "orange")
				sprHead = new Spritemap(ORANGEFACES, 640, 480);
			if (color == "green")
				sprHead = new Spritemap(GREENFACES, 640, 480);
			
			_played = false;
			Text.size = 40;
			
			sprHead.add("face", [0], 1, true);
			sprHead.add("bucky", [1], 1, true);
			
			addGraphic(sprHead);
			sprHead.play("face");
			_frame = 0;
		}
		
		override public function update():void
		{
			if (!_played)
			{
				switch(_frame) {
					case 0:
						_played = true;
						sprHead.play("head");
						
						_topText = new Text("Hello.");
						_top = new Entity((FP.width / 2) - (_topText.width / 2), 10, _topText);
						add(_top);
						
						_bottomText = new Text("I've never seen you before.");
						_bottom = new Entity((FP.width / 2) - (_bottomText.width / 2), 400, _bottomText);
						add(_bottom);
						break;
					case 1:
						recycle(_top);
						recycle(_bottom);
						_played = true;
						sprHead.play("bucky");
						
						_topText = new Text("I've tried for so long");
						_top = new Entity((FP.width / 2) - (_topText.width / 2), 10, _topText);
						add(_top);
						break;
					case 2:
						recycle(_top);
						recycle(_bottom);
						_played = true;
						sprHead.play("head");
						
						_topText = new Text("I've always been distracted.");
						_top = new Entity((FP.width / 2) - (_topText.width / 2), 10, _topText);
						add(_top);
						
						break;
					case 3:
						recycle(_top);
						_played = true;
						sprHead.play("head");
						
						_topText = new Text("What's your name?");
						_top = new Entity((FP.width / 2) - (_topText.width / 2), 10, _topText);
						add(_top);
						break;
					case 4:
						recycle(_top);
						_played = true;
						sprHead.play("bucky");
						
						_topText = new Text("Buckingham.");
						_top = new Entity((FP.width / 2) - (_topText.width / 2), 10, _topText);
						add(_top);
						break;
					case 5:
						recycle(_top);
						_played = true;
						sprHead.visible = false;
						var _titleText:Text = new Text("The end.");
						var _title:Entity = new Entity((FP.width / 2) - (_titleText.width / 2), (FP.height / 2) - (_titleText.height / 2), _titleText);
						add(_title);
						
						break;
				}
			}
			
			if (Input.pressed(Key.SPACE))
			{
				_frame++;
				_played = false;
			}
		}
		
	}

}