package armory.logicnode;

import armory.trait.navigation.Navigation;
import iron.object.Object;
import iron.math.Vec4;

class StopAgentNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		
		if (object == null) return;

#if arm_navigation
		var agent:armory.trait.NavAgent = object.getTrait(armory.trait.NavAgent);
		agent.stop();
#end

		super.run();
	}
}
