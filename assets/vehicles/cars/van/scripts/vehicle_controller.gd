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


@export_category("Powertrain")
@export_group("Engine")
##
@export var TORQUE_CURVE: Curve
##
@export var TURBOCHARGER_CURVE: Curve
##
@export var SUPERCHARGER_CURVE: Curve

@export_group("Transmission")
##
@export var FINAL_DRIVE: float = 3.28
##
@export var GEAR_RATIO: Array[float] = [2.69, 2.01, 1.59, 1.32, 1.13, 1.0]
##
@export var REVERSE_RATIO: float = -2.5

@export_group("Differential")
##
@export var FRONT_DIFFERENTIAL_ACCELERATION = 0
##
@export var FRONT_DIFFERENTIAL_DECCELERATION = 0
##
@export var BACK_DIFFERENTIAL_DECCELERATION = 0
##
@export var BACK_DIFFERENTIAL_ACCELERATION = 0


@export_category("Aero")
@export var FRONT_DOWNFORCE = 0
@export var REAR_DOWNFORCE = 0


@export_category("Chassis")
@export_group("Wheel Alignment")
@export_subgroup("Camber")
@export var FRONT_CAMBER = 0
@export var REAR_CAMBER = 0

@export_subgroup("Toe")
@export var FRONT_TOE = 0
@export var REAR_TOE = 0

@export_group("Anti-Roll Bars")
##
@export var FRONT_ANTIROLL_BARS = 0
##
@export var REAR_ANTIROLL_BARS = 0

@export_group("Springs")
##
@export var FRONT_RIDE_HEIGHT = 0
##
@export var REAR_RIDE_HEIGHT = 0
##
@export var FRONT_SPRING_STIFFNESS = 0
##
@export var REAR_SPRING_STIFFNESS = 0

@export_group("Damping")
##
@export var FRONT_BUMP = 0
##
@export var REAR_BUMP = 0
##
@export var FRONT_REBOUND = 0
##
@export var REAR_REBOUND = 0


@onready var MAX_RPM = TORQUE_CURVE.max_domain * 1000
@onready var rpm = TORQUE_CURVE.min_domain * 1000

var THROTTLE_DEADZONE = 0.1
var current_gear = 0


func _physics_process(delta: float) -> void:
    var braking = Input.get_action_strength("vehicle_brake")
    var throttle = Input.get_action_strength("vehicle_throttle")

    if throttle > THROTTLE_DEADZONE:
        pass
