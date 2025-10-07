extends VehicleMiddleware

const _shake_preset_earthquake = preload("res://addons/shaker/data/resources/shaker_earthquake3D.tres")
const _shake_preset_head_blob = preload("res://addons/shaker/data/resources/shaker_head_blob3D.tres")

@export var squeal_sound: AudioStreamPlayer3D
@export var wheelspin_shake_intensity := 0.1

var wheelspin = false


func _on_smoke_on_wheelspin(_wheel: Wheel) -> void:
    wheelspin = true


func process_vehicle(_vehicle: Vehicle, camera: Camera3D, _delta):
    #? This should probably be a state machine or something else less... hacky.
    #? It works but frankly a bit dirty.
    if wheelspin and not squeal_sound.playing:
        squeal_sound.play()

    if wheelspin and squeal_sound.playing and squeal_sound.get_playback_position() > 0.6:
        squeal_sound.play(0.3)

    if wheelspin:
        Shaker.shake_by_preset(_shake_preset_earthquake, camera, 1.5, 1, wheelspin_shake_intensity)
        wheelspin = false
