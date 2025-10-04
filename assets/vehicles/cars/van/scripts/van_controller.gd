extends "res://addons/gevp/scripts/vehicle.gd"


func _physics_process(delta: float) -> void:
    super (delta)

    print(linear_velocity)
