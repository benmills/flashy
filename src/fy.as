package {
	import flash.display.*;
	import flash.events.*;
	
	public class fy extends Sprite {
		public var target:*;
		public static var events:Object = {
			"mouseDown": MouseEvent.MOUSE_DOWN
		}
		
		public function fy(t:*) {
			this.target = t;
		}
		
		public function config(args:Object):* {
			this.target = fy.config(this.target, args);
			return this;
		}
		
		public function bind(args:Object):void {
		  for(var i:String in args) this.target.addEventListener(events[i], args[i]);
		}
		
		public static function $(t:*):fy {
			return new fy(t);
		}
		
		public static function config(target:*, args:Object):* {
			// Speical Artributes
			if (args.parent) {
				args.parent.addChild(target) as Sprite;
				delete(args.parent);
			}
			if (args.click) {
				target.buttonMode = true;
				target.addEventListener(MouseEvent.MOUSE_DOWN, args.click);
				delete(args.click);
			}
			if (args.backgroundColor != null) {
				target.graphics.beginFill(args.backgroundColor);
				target.graphics.drawRect(0,0,args.width,args.height);
				target.graphics.endFill();
				delete(args.backgroundColor);
			}
			if (args.hitspace) {
				target.graphics.drawRect(0,0,args.width,args.height);
				delete(args.hitspace);
			}

			for (var a:* in args) target[a] = args[a];

			return target;
		}
	}
}
