extends Node3D


@export_node_path("VehicleAxle3D") var axle_path

##
@export_range(0, 1) var slip_limit: float = 1

@onready var axle = get_node(axle_path)


func apply_power(torque: float) -> void:
    axle = axle as VehicleAxle3D

    var slip_difference = clampf(axle.slip_difference, -slip_limit, slip_limit)

    axle.left_wheel = (torque / 2) - (torque * slip_difference)
    axle.right_wheel = (torque / 2) + (torque * slip_difference)
