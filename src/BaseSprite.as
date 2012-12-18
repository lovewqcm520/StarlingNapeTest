package
{
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class BaseSprite extends Sprite
	{
		public function BaseSprite()
		{
			super();
		}
		
		public function addChildScaled(child:DisplayObject):DisplayObject
		{
			child.scaleX = Const.CONTENT_SCALE_X;
			child.scaleY = Const.CONTENT_SCALE_Y;
			
			return addChild(child);
		}
		
		
	}
}