package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class CanvasSetTextNode extends LogicNode {

	var canvas:CanvasScript;
	var element:String;
	var text:Dynamic;

	public function new(tree:LogicTree) {
		super(tree);
	}

#if arm_ui
	function update() {
		if (!canvas.ready) return;
		tree.removeUpdate(update);

		canvas.getElement(element).text = Std.string(text);
		super.run();
	}

	override function run(action:Int=0) {
		element = inputs[1].get();
		text = inputs[2].get();
		canvas = Scene.active.getTrait(CanvasScript);
		if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);

		tree.notifyOnUpdate(update);
		update();
	}
#end
}
