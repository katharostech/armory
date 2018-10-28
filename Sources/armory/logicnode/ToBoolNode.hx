package armory.logicnode;

class ToBoolNode extends LogicNode {

	var value:Bool;
	var b = false;

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		b = true;
	}

	override function get(from:Int):Dynamic {
		value = b;
		b = false;
		return value;
	}
}
