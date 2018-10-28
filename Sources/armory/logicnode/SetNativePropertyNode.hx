package armory.logicnode;

import iron.object.Object;

class SetNativePropertyNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run(action:Int=0) {
		var object:Object = inputs[1].get();
		var property:String = inputs[2].get();
		var value:Dynamic = inputs[3].get();
		
		if (object == null) return;

		Reflect.setProperty(object, property, value);

		super.run();
	}
}
