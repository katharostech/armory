package armory.logicnode;

import iron.object.MeshObject;
import iron.data.MaterialData;

class SetMaterialNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:MeshObject = inputs[1].get();
		var mat:MaterialData = inputs[2].get();
		
		if (object == null) return;

		for (i in 0...object.materials.length) {
			object.materials[i] = mat;
		}

		super.run();
	}
}
