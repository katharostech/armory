package armory.logicnode;

class LoopBreakNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		tree.loopBreak = true;
	}
}
