package {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import asunit.textui.TestRunner;
	
	public class fyRunner extends TestRunner {

		public function fyRunner() {
			trace("Started Testing");
			
			/*var map:Sprite = fy.config(new Sprite(), {x:50, y:50, width:200, height:200, backgroundColor:0xFF0000, alpha:0.8});
			var bound:Sprite = fy.config(new Sprite(), {x:50, y:50, width:map.width*2, height:map.height*2, parent:this, alpha:0.3, backgroundColor:0x0000FF});
			addChild(map);
			
			fy.bind(map, {
				mouseDown: function():void {
					map.startDrag(false, new Rectangle(0, 0, bound.width-map.width, bound.height-map.height));
				},
				mouseUp: function():void {
					map.stopDrag();
				}
			})*/
			
			var box:Sprite = fy.config(Sprite, {width:10, height:10, backgroundColor:0xFF0000, parent:this});
			
			fy.bind(box, {
			  mouseOver: function(e:Event) {
			    e.target.alpha = 0.5;
			  },
			  mouseOut: function(e:Event) {
			    e.target.alpha = 1;
			  }
				});


			
			/*// fy object
			fy.$(new Sprite()).config({
				parent:this, 
				backgroundColor:0xFF0000, 
				width:50, height:50, 
				x:50, y:50}
			).bind({
				mouseDown: function():void {
					trace("test");
				}}
			).addChildren([
				fy.config(new Sprite(), {width:5, height:5, x:5, y:5, backgroundColor:0x00FF00}),
				fy.config(new Sprite(), {width:5, height:5, x:5, y:15, backgroundColor:0x00FF00})
			]);*/
			
			// array contains
			var testArray:Array = [1, 2, 4, 5];
			trace("does testArray contain 3 (e:Fales)? "+fy.arrayContains(3, testArray));
			trace("does testArray contain 1 (e:True)? "+fy.arrayContains(1, testArray));
			trace("does testArray contain 3, 7 and 8 (e:False)? "+fy.arrayContains([3, 7, 8], testArray));
			trace("does testArray contain 3, 1 and 8 (e:False)? "+fy.arrayContains([3, 1, 8], testArray));
			trace("does testArray contain 1, 2 and 4 (e:True)? "+fy.arrayContains([1, 2, 4], testArray));
			
			testArray = [1, 2, 4];
			trace("does testArray contain 1, 2 and 4 (e:True)? "+fy.arrayContains([1, 2, 4], testArray));
			
			testArray = [];
			trace("does testArray contain 1 (e:False)? "+fy.arrayContains(1, testArray));
			trace("does testArray contain [] (e:True)? "+fy.arrayContains([], testArray));
		}
	}
}
