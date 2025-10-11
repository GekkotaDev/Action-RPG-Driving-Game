extends Node3D

func _on_powerup_claim(node: Vehicle):
    var parent = node.get_parent()

    if not parent is VehicleInputController: return
    parent = parent as VehicleInputController
