extends VehicleMiddleware

@export var idle_offset: int = 200
@export var idle_sound: AudioStreamPlayer3D

func process_vehicle(vehicle: Vehicle, _camera, _delta):
    if vehicle.motor_rpm > vehicle.idle_rpm + idle_offset:
        idle_sound.stop()
        return

    if idle_sound.playing == false:
        idle_sound.play()
