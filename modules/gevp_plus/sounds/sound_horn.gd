extends AudioStreamPlayer3D


@export var loop_start := 0.1
@export var loop_end := 0.5


func _in_between(left: float, right: float, value: float) -> bool:
    return value > left and value < right


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("vehicle_honk") and not playing:
        print("honk start")
        play()
        return

    var progress = get_playback_position()
    if Input.is_action_pressed("vehicle_honk") and progress >= loop_end:
        play(loop_start)
        return

    if event.is_action_released("vehicle_honk"):
        play(loop_end)
