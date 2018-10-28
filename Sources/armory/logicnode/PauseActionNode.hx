package armory.logicnode;

import iron.object.Object;

class PauseActionNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		
		if (object == null) return;
		var animation = object.animation;
		if (animation == null) animation = object.getParentArmature(object.name);

		animation.pause();

		super.run();
	}
}
