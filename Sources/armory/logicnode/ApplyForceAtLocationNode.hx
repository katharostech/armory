package armory.logicnode;

import iron.object.Object;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

class ApplyForceAtLocationNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		var force:Vec4 = inputs[2].get();
        var location:Vec4 = inputs[3].get();
		
		if (object == null || force == null || location == null) return;

#if arm_physics
		var rb:RigidBody = object.getTrait(RigidBody);
		rb.applyForce(force, location);
#end

		super.run();
	}
}
