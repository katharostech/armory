package armory.logicnode;

import iron.object.Object;

class RemoveObjectNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		
		if (object == null) return;

		object.remove();

		super.run();
	}
}
