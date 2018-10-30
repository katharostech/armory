import bpy
from bpy.props import *
from bpy.types import Node, NodeSocket
from arm.logicnode.arm_nodes import *

class RotateObjectNode(Node, ArmLogicTreeNode):
    '''Rotate object node'''
    bl_idname = 'LNRotateObjectNode'
    bl_label = 'Rotate Object'
    bl_icon = 'GAME'

    property0 = EnumProperty(
        items = [
            ('Local Space', 'Local Space', 'Local Space'),
            ('World Space', 'World Space', 'World Space'),
        ],
        name='', default='Local Space')

    def init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('ArmNodeSocketObject', 'Object')
        self.inputs.new('NodeSocketVector', 'Vector')
        self.outputs.new('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')

add_node(RotateObjectNode, category='Action')
