package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF (width="800", height="600", frameRate="60", backgroundColor="0xffffff")]
	public class StarlingNapeTest extends Sprite
	{
		public function StarlingNapeTest()
		{
			super();
		
			if(this.stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			Const.ACTUAL_WIDTH = stage.fullScreenWidth;
			Const.ACTUAL_HEIGHT = stage.fullScreenHeight;
			
			Const.CONTENT_SCALE_X = Const.ACTUAL_WIDTH / Const.DESIGH_WIDTH;
			Const.CONTENT_SCALE_Y = Const.ACTUAL_HEIGHT / Const.DESIGH_HEIGHT;
			
			var vp:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			var star:Starling = new Starling(Startup, this.stage, vp);
			star.showStats = true;
			star.start();
		}
	}
}