package {
	import flash.display.*;
	import flash.events.*;
	import asunit.textui.TestRunner;
	
	public class fyRunner extends TestRunner {

		public function fyRunner() {
			trace("Started Testing");
			
			// fy object
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
			]);
			
			// array contains
			var testArray:Array = [1, 2, 4, 5];
			trace("does testArray contain 3 (e:Fales)? "+fy.arrayContains(3, testArray));
			trace("does testArray contain 1 (e:True)? "+fy.arrayContains(1, testArray));
			trace("does testArray contain 3, 7 and 8 (e:False)? "+fy.arrayContains([3, 7, 8], testArray));
			trace("does testArray contain 3, 1 and 8 (e:False)? "+fy.arrayContains([3, 1, 8], testArray));
			trace("does testArray contain 1, 2 and 4 (e:True)? "+fy.arrayContains([1, 2, 4], testArray));
			
			testArray = [1, 2, 4];
			trace("does testArray contain 1, 2 and 4 (e:True)? "+fy.arrayContains([1, 2, 4], testArray));
		}
	}
}
