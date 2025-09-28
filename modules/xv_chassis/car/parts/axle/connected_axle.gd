class_name VehicleAxle3D extends Node3D

var left_wheel: VehicleWheel3D
var right_wheel: VehicleWheel3D

@export_node_path("VehicleWheel3D") var left_wheel_path
@export_node_path("VehicleWheel3D") var right_wheel_path

@export var antiroll: float = 0.1

## Compression
@export var damper_bump: float = 0.83

@export var damper_rebound: float = 0.88

@export var ride_height: float = 0.2

@export var spring_rest: float = 0.15

@export var spring_rate: float = 6000

@export var spring_stiffness: float = 5.88

@export var wheel_camber: float = 0

@export var wheel_radius: float:
    get():
        return left_wheel.wheel_radius

@export var wheel_toe: float = 0


func _set_parameters(wheel: VehicleWheel3D) -> void:
    wheel.damping_compression = damper_bump
    wheel.damping_relaxation = damper_rebound
    wheel.rotation.x = wheel_camber * -1
    wheel.rotation.y = wheel_toe
    wheel.suspension_max_force = spring_rate
    wheel.suspension_stiffness = spring_stiffness
    wheel.suspension_travel = ride_height
    wheel.wheel_rest_length = spring_rest
    wheel.wheel_roll_influence = antiroll


func refresh_parameters() -> void:
    _set_parameters(left_wheel)
    _set_parameters(right_wheel)


func _ready() -> void:
    left_wheel = get_node(left_wheel_path)
    right_wheel = get_node(right_wheel_path)
    refresh_parameters()


func rpm():
    return left_wheel.get_rpm() + right_wheel.get_rpm() / 2
