extends Node3D

const DAYLIGHT_CYCLE_NORMALIZED = 360

@export var _timeline: AnimationPlayer

@onready var astro_angle: float:
    get:
        var cycles = _timeline.current_animation_length / DAYLIGHT_CYCLE_NORMALIZED
        var timestamp = _timeline.current_animation_position / cycles
        return timestamp


func _process(_delta: float) -> void:
    pass
