@tool
extends SubViewportContainer


@export_group("Camera")
@export var POSITION: Vector3 = Vector3.ZERO
@export var ROTATION: Vector3 = Vector3.ZERO

@onready var viewport_camera = %ViewportCamera as Camera3D


func _process(delta: float) -> void:
    viewport_camera.transform.origin = POSITION
    viewport_camera.rotation_degrees = ROTATION
