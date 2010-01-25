package {
	import flash.display.*;
	import flash.events.*;
	
	public class fy extends Sprite {
		public var target:*;
		public static var events:Object = {
			mouseDown: MouseEvent.MOUSE_DOWN,
			mouseUp: MouseEvent.MOUSE_UP,
			mouseOver: MouseEvent.MOUSE_OVER,
			mouseOut: MouseEvent.MOUSE_OUT,
			click: MouseEvent.CLICK
		}
		
		// Flashy Object
		
		public function fy(t:*) {
			this.target = t;
		}
		
		public function config(args:Object):fy {
			this.target = fy.config(this.target, args);
			return this;
		}
		
		public function bind(args:Object):fy {
			fy.bind(this.target, args);
			return this;
		}
		
		public function addChildren(children:Array):fy {
			fy.addChildren(this.target, children);
			return this;
		}
		
		public static function $(t:*):fy {
			return new fy(t);
		}
		
		// Builders
		
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
		
		public static function bind(target:*, args:Object):void {
		  for(var i:String in args) target.addEventListener(events[i], args[i]);
		}

		// Utilities

		public static function addChildren(parent:Sprite, children:Array):void {
			for each (var child:* in children) parent.addChild(child);
		}

		public static function arrayContains(target:*, a:Array):Boolean {
			var doesNotContain:Boolean = false;
			return a.some(function(e:*, i:int, ar:Array):Boolean {
				var contains:Boolean = false;
				if (target is Array) {
					for(var ii:String in target) if (!arrayContains(target[ii], a)) doesNotContain = true;
					contains = doesNotContain? false:true;
				} else contains = (e == target);
				return contains;
			});
		}
		
		/*
		findItem Function, takes in a tester function and a array (or XML) and when tester function returns true findItem will return the current item. If the item does not exist it will return null

		The tester function must have a return type of Boolean and its only argument must be the item type of the list.

		Example usage of findItem:

		var names:Array = ["Ben", "Jess", "Jack"];
		var returnValue:String = findItem(function(i:String):Boolean{return (i == "Jess")}, names);
		trace(returnValue); // output: "Ben"
		*/
		
		public static function findItem(func:Function, list:*):* {
			for each (var i:* in list) if (func(i)) return i;
			return null;
		}

		// Debug / Development

		public function position(target:Sprite):void {
			trace("fy: init positioning on "+target);
			target.addEventListener(MouseEvent.MOUSE_DOWN, function():void {
				target.startDrag();
			});
			target.addEventListener(MouseEvent.MOUSE_UP, function():void {
				target.stopDrag();
				trace("- - - - - - - -");
				trace("[taret: "+target+"] x:"+target.x+", y:"+target.y);
				trace("- - - - - - - -");
			});
		}
	}
	

}
