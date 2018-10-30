package armory.logicnode;

import iron.object.Object;
import iron.math.Mat4;
import iron.math.Quat;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

class RotateObjectNode extends LogicNode {

	public var property0:String; // Local Space or World Space
	var q = new Quat();

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(from:Int) {
		var object:Object = inputs[1].get();
		var vec:Vec4 = inputs[2].get();

		if (object == null || vec == null) return;

		q.fromEuler(vec.x, vec.y, vec.z);

		switch (property0) {
		case "Local Space":
			object.transform.rot.mult(q);
		case "World Space":
			var ot = object.transform;
			var prevLoc = ot.loc;
			ot.loc = new Vec4(0, 0, 0);
			ot.multMatrix(Mat4.identity().fromQuat(q));
			ot.loc = prevLoc;
		}

		object.transform.buildMatrix();

		#if arm_physics
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
		#end

		runOutput(0);
	}
}
