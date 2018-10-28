package armory.logicnode;

/**
 * A node in a `LogicTree`.
 */
class LogicNode {

	var tree:LogicTree;
	/** Connected value inputs. */
	var inputs:Array<LogicNodeInput> = [];
	/** Connected action outputs. */
	var outputs:Array<Array<LogicNodeOutput>> = [];

	#if arm_debug
	/** Name of the node in the debug console. */
	public var name = "";
	/**
	 * Set whether or not to watch this node in the debug console.
	 * @param b Watch node.
	 */
	public function watch(b:Bool) { // Watch in debug console
		var nodes = armory.trait.internal.DebugConsole.watchNodes;
		b ? nodes.push(this) : nodes.remove(this);
	}
	#end

	/**
	 * Create a node in a `LogicTree`.
	 */
	public function new(tree:LogicTree) {
		this.tree = tree;
	}

	/**
	 * Add a connection to one of the node's value inputs. Sequential calls
	 * will continue to connect the next input in line.
	 * @param node The node to connect the input to.
	 * @param from The value output of the `node` to connect to.
	 */
	public function addInput(node:LogicNode, from:Int) {
		inputs.push(new LogicNodeInput(node, from));
	}

	/**
	 * Create a set of connections from one of the action outputs of this node.
	 * Sequential Calls
	 * @param nodeOutputs 
	 */
	public function addOutputs(nodeOutputs:Array<{node:LogicNode, to:Int}>) {
		outputs.push(nodeOutputs.map(v -> {
			return new LogicNodeOutput(v.node, v.to);
		}));
	}

	/**
	 * This is called by `LogicNode`s connected to the action inputs of this
	 * node. The parameter `i` indicates the index of the action that should
	 * be triggered in the node.
	 * 
	 * The default behavior of this function is to trigger all of this nodes
	 * action outputs.
	 * @param i Index of the action to run.
	 */
	@:allow(armory.logicnode.LogicNodeOutput)
	function run(i:Int=0) { for (ar in outputs) for (o in ar) o.run(); }

	/**
	 * Run all action nodes connected to the given action output.
	 * @param i Index of the action output to trigger.
	 */
	function runOutputs(i:Int) { if (i < outputs.length) for (o in outputs[i]) o.run(); }

	/**
	 * Get the value of a value output of the node.
	 * @param from The index of the value output to get.
	 * @return The value of the given value output.
	 */
	@:allow(armory.logicnode.LogicNodeInput)
	function get(from:Int):Dynamic { return this; }

	/**
	 * Set the value of the node. Used internally.
	 * @param value The value to set.
	 */
	@:allow(armory.logicnode.LogicNodeInput)
	function set(value:Dynamic) { }
}

/**
 * A value input to a `LogicNode`. Provides a way for a `LogicNode` to access
 * connected input values.
 * 
 * `LogicNodeInput`s only represent value inputs and are not created for action
 * inputs. Overriding `LogicNode.run()` is the way to handle action inputs for
 * a `LogicNode`.
 */
class LogicNodeInput {

	/** The node the input is connected to. */
	@:allow(armory.logicnode.LogicNode)
	var node:LogicNode;
	/** The index of the connected node's value output. */
	var from:Int;

	/**
	 * Create a connection to another node's value output.
	 * @param node The node to connect to.
	 * @param from The value output of the node to connect to.
	 */
	public function new(node:LogicNode, from:Int) {
		this.node = node;
		this.from = from;
	}

	/**
	 * Get the value of the connected input.
	 */
	@:allow(armory.logicnode.LogicNode)
	function get():Dynamic {
		return node.get(from);
	}

	/**
	 * Set the value of the connected input.
	 */
	@:allow(armory.logicnode.LogicNode)
	function set(value:Dynamic) {
		node.set(value);
	}
}

/**
 * An action output of a `LogicNode`. Provides a `LogicNode` with a way to
 * trigger the actions of connected `LogicNodes`. A `LogicNodeOutput` is
 * created for every connection that each action output in a `LogicNode` has.
 * 
 * `LogicNodeOutput`s are only created for action output connections of a
 * `LogicNode` and have nothing to do with any value outputs of the node.
 * Overriding `LogicNode.get()` is the way to handle the value ouputs of a
 * `LogicNode`.
 */
class LogicNodeOutput {
	/** The node that this output is connected to. */
	@:allow(armory.logicnode.LogicNode)
	var node:LogicNode;
	/** The action input index on the target node. */
	var to:Int;

	/**
	 * Create a connection to an action input on a `LogicNode`.
	 * @param node The node to connect this output to.
	 * @param to The index of the action input on the `node`.
	 */
	public function new(node:LogicNode, to:Int) {
		this.node = node;
		this.to = to;
	}

	/**
	 * Trigger the action of the connected node.
	 */
	@:allow(armory.logicnode.LogicNode)
	function run() {
		this.node.run(this.to);
	}
}
