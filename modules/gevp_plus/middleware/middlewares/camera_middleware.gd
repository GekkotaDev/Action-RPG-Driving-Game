extends VehicleMiddleware


@export var dof_curve: Curve
@export var fov_curve: Curve

var _shake_preset: ShakerPreset3D = preload("res://addons/shaker/data/resources/shaker_head_blob3D.tres")

func process_vehicle(vehicle: Vehicle, camera: Camera3D, _delta):
    camera.fov = fov_curve.sample_baked(VehicleCompute.compute_speed_kmh(vehicle))
    camera.attributes.dof_blur_far_transition = dof_curve.sample_baked(VehicleCompute.compute_speed_kmh(vehicle))
