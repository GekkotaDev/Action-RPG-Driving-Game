class_name Differential extends Node3D


@export_group("Wheels")
@export var LEFT_WHEEL_PATH: NodePath
@export var RIGHT_WHEEL_PATH: NodePath

@export_group("Parameters")
@export var TORQUE = 1
@export var ACCELERATION_FACTOR: float
@export var DECCELERATION_FACTOR: float


@onready var left_wheel: VehicleWheel3D = get_node(LEFT_WHEEL_PATH)
@onready var right_wheel: VehicleWheel3D = get_node(RIGHT_WHEEL_PATH)


func _physics_process(delta: float) -> void:
    var slip_difference = left_wheel.wheel_friction_slip - right_wheel.wheel_friction_slip
    var left_torque = (TORQUE / 2) * (slip_difference * 1)
    var right_torque = (TORQUE / 2) * (slip_difference * -1)
