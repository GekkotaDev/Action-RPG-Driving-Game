extends VehicleMiddleware

const _shake_preset_earthquake = preload("res://addons/shaker/data/resources/shaker_earthquake3D.tres")

@export var dof_curve: Curve
@export var fov_curve: Curve
@export var shake_curve: Curve


func process_vehicle(vehicle: Vehicle, camera: Camera3D, _delta):
    var target_fov = fov_curve.sample_baked(VehicleCompute.compute_speed_kmh(vehicle))
    var target_dof = dof_curve.sample_baked(VehicleCompute.compute_speed_kmh(vehicle))
    var target_shake = shake_curve.sample_baked(VehicleCompute.compute_speed_kmh(vehicle)) * 0.1

    camera.fov = target_fov
    camera.attributes.dof_blur_far_transition = target_dof

    if Input.is_action_pressed("vehicle_throttle"):
        Shaker.shake_by_preset(_shake_preset_earthquake, camera, 1, 1, target_shake)
