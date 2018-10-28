package armory.logicnode;

import iron.object.MeshObject;
import iron.data.MeshData;

class SetMeshNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:MeshObject = inputs[1].get();
		var mesh:MeshData = inputs[2].get();
		
		if (object == null) return;

		object.data = mesh;

		super.run();
	}
}
