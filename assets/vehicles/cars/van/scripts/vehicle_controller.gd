"""
[TODO]

- Modularize all components of the car platform.
"""

extends VehicleBody3D


@export_category("Controller")
@export_group("Cameras")
## 
@export var BUMPER_CAMERA: NodePath
##
@export var HOOD_CAMERA: NodePath
##
@export var CHASE_CAMERA: NodePath

@export_group("Metadata")
##
@export var UUID: String
##
@export var TAGS: Array[String]

@export_group("Dimensions")
##
@export var WHEEL_RADIUS: float


func _process(delta: float) -> void:
    var braking = Input.get_action_strength("vehicle_brake")
    var throttle = Input.get_action_strength("vehicle_throttle")

    $VehicleDrivetrain.apply_power(throttle)
