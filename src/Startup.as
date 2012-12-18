package
{
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.Debug;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Startup extends BaseSprite
	{
		[Embed (source="assets/back.png")]
		private var back:Class;

		private var space:Space;

		private var debug:BitmapDebug;
		
		public function Startup()
		{
			super();
			
			init();
		
		}
		
		private function init():void
		{
			// add background image
			addChildScaled(Image.fromBitmap(new back()));
			
			// new space
			space = new Space(new Vec2(0, 3000));
			//debug = new BitmapDebug(800, 600);
			
			// add floor
			var floor:Body = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(0, Const.ACTUAL_HEIGHT, Const.ACTUAL_WIDTH, 10)));
			floor.space = space;
			
			// add event enter_frame listener
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			// set the space step
			space.step(1/60);
			
			// add ball into space dynamicly
			if(Math.random() < 0.2)
				addBall();
			
			for (var i:int = 0; i < space.liveBodies.length; i++) 
			{
				var body:Body = space.liveBodies.at(i);
				// update body's graphic
				if(body.userData.graphicUpdate)
				{
					body.userData.graphicUpdate(body);
				}
				
				// remove the body when ball out of the scene
				if(body.userData.graphic)
				{
					if(body.userData.graphic.x < 0 || body.userData.graphic.x > Const.ACTUAL_WIDTH)
					{
						space.bodies.remove(body);
						Sprite(body.userData.graphic).removeFromParent(true);
						body.userData.graphic = null;
						body.userData.graphicUpdate = null;
						body.shapes.clear();
						body = null;
					}
				}
			}			
		}
		
		private function addBall():void
		{
			var ball:Ball = new Ball();
			
			var b:Body = new Body(BodyType.DYNAMIC, new Vec2(Math.random()*750, -100));
			b.shapes.add(new Circle(ball.width/2, null, new Material(2)));
			// attach graphic and graphicUpdate function to body
			b.userData.graphic = ball;
			b.userData.graphicUpdate = ballUpdate;
			b.space = space;
			
			addChild(ball);
		}
		
		private function ballUpdate(b:Body):void
		{
			b.userData.graphic.x = b.position.x;
			b.userData.graphic.y = b.position.y;
			b.userData.graphic.rotation = b.rotation;
		}
	}
}