package armory.logicnode;

class ShowMouseNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var show:Bool = inputs[1].get();
		var mouse = iron.system.Input.getMouse();
		show ? mouse.show() : mouse.hide();
		super.run();
	}
}
