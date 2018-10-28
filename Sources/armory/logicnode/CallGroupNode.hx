package armory.logicnode;

class CallGroupNode extends LogicNode {

	public var property0:String;
	var callTree:LogicTree = null;

	public function new(tree:LogicTree) {
		super(tree);
	}

	@:access(iron.Trait)
	override function run(action:Int=0) {

		if (callTree == null) {
			var classType = Type.resolveClass(property0);
			callTree = Type.createInstance(classType, []);
			callTree.object = tree.object;
			callTree.add();
		}

		if (callTree._init != null) callTree._init[0]();

		runOutputs(0);
	}
}
