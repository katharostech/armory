package armory.logicnode;

class IsFalseNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {

		var v1:Bool = inputs[1].get();
		if (!v1) super.run();
	}
}
