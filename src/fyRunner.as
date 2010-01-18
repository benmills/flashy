package {
	import flash.display.*;
	import flash.events.*;
	import asunit.textui.TestRunner;
	
	public class fyRunner extends TestRunner {

		public function fyRunner() {
			trace("Started Testing");
			
			fy.$(new Sprite()).config({
				parent:this, 
				backgroundColor:0xFF0000, 
				width:50, height:50, 
				x:50, y:50}).bind({
				mouseDown: function():void {
					trace("test");
				}
			});
		}
	}
}
