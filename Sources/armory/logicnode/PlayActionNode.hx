package armory.logicnode;

import iron.object.Object;

class PlayActionNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		var action:String = inputs[2].get();
		// TODO: assume input exists
		var blendTime:Float = inputs.length > 3 ? inputs[3].get() : 0.2;
		
		if (object == null) return;
		var animation = object.animation;
		if (animation == null) animation = object.getParentArmature(object.name);

		animation.play(action, function() {
			runOutputs(1);
		}, blendTime);

		runOutputs(0);
	}
}
