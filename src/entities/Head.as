package entities 
{
	import flash.events.IMEEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import worlds.Conversation;

	public class Head extends Entity
	{
		[Embed(source = '../assets/redhead.png')]
		private const REDHEAD:Class;
		
		[Embed(source = '../assets/orangehead.png')]
		private const ORANGEHEAD:Class;
		
		[Embed(source = '../assets/greenhead.png')]
		private const GREENHEAD:Class;
		
		private var endY:Number;
		private var _color:String;
		public function Head(x:Number, right:Boolean, color:String) 
		{
			if (color == "red")
				graphic = new Image(REDHEAD);
			if (color == "green")
				graphic = new Image(GREENHEAD);
			if (color == "orange")
				graphic = new Image(ORANGEHEAD);
				
			_color = color;
			
			/*
			if (right)
				this.x = x + 150;
			else
			*/
			this.x = x - 50;
			
			this.y = -500;
		}
		
		override public function update():void
		{
			if (y < -10)
				y += 2;
			else
				FP.world = new Conversation(_color);
		}
		
	}

}