extends Node3D

@export var torque_curve: Curve

@export_node_path("VehicleBody3D") var chassis_path
@export var driving_axles_path: Array[NodePath]
@export var transmission: VehicleTransmission

@onready var chassis: VehicleBody3D = get_node(chassis_path)
@onready var driving_axles = driving_axles_path.map(func(path: NodePath): return get_node(path))


var MAGIC_ENGINE_FORCE = 0.5
var clutch_position = 6


func calculate_rpm() -> float:
    if transmission.current_gear == 0:
        return 0.0

    var wheel_rpm = driving_axles \
        .map(
            func(axle: VehicleAxle3D): return axle.rpm()
        ) \
        .reduce(
            func(accumulator: float, current: float): return accumulator + current
        ) / driving_axles.size()
    var driveshaft_rpm = wheel_rpm * transmission.final_drive_ratio

    if transmission.current_gear < 0:
        return 100 * driveshaft_rpm * -transmission.reverse_ratio

    if transmission.current_gear <= transmission.gear_ratios.size():
        return 100 * driveshaft_rpm * transmission.gear_ratios[transmission.current_gear - 1]

    return 0


func apply_power(throttle: float):
    chassis = chassis as VehicleBody3D

    var rpm = calculate_rpm()
    var torque = 10 * torque_curve.sample_baked(rpm)

    if transmission.current_gear < 0:
        chassis.engine_force = \
            clutch_position \
            * throttle \
            * torque \
            * transmission.reverse_ratio \
            * transmission.final_drive_ratio \
            * MAGIC_ENGINE_FORCE

    if transmission.current_gear > 0 and transmission.current_gear <= transmission.gear_ratios.size():
        chassis.engine_force = \
            clutch_position \
            * throttle \
            * torque \
            * transmission.gear_ratios[transmission.current_gear - 1] \
            * transmission.final_drive_ratio \
            * MAGIC_ENGINE_FORCE
    
    if transmission.current_gear == 0:
        chassis.engine_force = 0

    print(chassis.engine_force)
