extends VehicleMiddleware

const _shake_preset_earthquake = preload("res://addons/shaker/data/resources/shaker_earthquake3D.tres")

@export var crash_sound: AudioStreamPlayer3D
@export var minimum_crash_velocity := -4

var previous_velocity = 0
var wheelspin = false


func process_vehicle(vehicle: Vehicle, camera: Camera3D, _delta):
    var velocity_difference = vehicle.linear_velocity.length() - previous_velocity
    if velocity_difference <= minimum_crash_velocity:
        var difference = abs(velocity_difference)
        Shaker.shake_by_preset(_shake_preset_earthquake, camera, 1, 1, difference)
        crash_sound.play()

    previous_velocity = vehicle.linear_velocity.length()
