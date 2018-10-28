package armory.logicnode;

class ShutdownNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		kha.System.stop();
	}
}
