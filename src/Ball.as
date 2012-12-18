package
{
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Ball extends Sprite
	{
		[Embed (source="assets/basketball.png")]
		private var basketball:Class;
		
		private static var bm:Bitmap;
		
		public function Ball()
		{
			super();
			
			if(!bm)
				bm = new basketball();
			
			addChild(Image.fromBitmap(bm));
		}
	}
}