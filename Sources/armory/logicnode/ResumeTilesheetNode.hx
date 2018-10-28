package armory.logicnode;

import iron.object.MeshObject;

class ResumeTilesheetNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:MeshObject = inputs[1].get();
		
		if (object == null) return;

		object.tilesheet.resume();

		super.run();
	}
}
