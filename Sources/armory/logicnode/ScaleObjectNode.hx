package armory.logicnode;

import iron.object.Object;
import iron.math.Mat4;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

class ScaleObjectNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		var vec:Vec4 = inputs[2].get();

		if (object == null || vec == null) return;

		object.transform.scale.add(vec);
		object.transform.buildMatrix();

		#if arm_physics
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
		#end

		super.run();
	}
}
