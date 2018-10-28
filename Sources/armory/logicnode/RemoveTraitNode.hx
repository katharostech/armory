package armory.logicnode;

import iron.object.Object;

class RemoveTraitNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var trait:Dynamic = inputs[1].get();
		if (trait == null) return;
		trait.remove();

		super.run();
	}
}
