package armory.logicnode;

class AlternateNode extends LogicNode {

	var b = true;

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		b ? runOutputs(0) : runOutputs(1);
		b = !b;
	}
}
