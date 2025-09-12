@tool
extends SubViewportContainer


@export_group("Camera")
@export var REFERENCE_CAMERA: NodePath
@export var POSITION: Vector3 = Vector3.ZERO
@export var ROTATION: Vector3 = Vector3.ZERO

@onready var followed_camera = get_node(REFERENCE_CAMERA) as Camera3D
@onready var viewport_camera = %ViewportCamera as Camera3D


func _process(_delta: float) -> void:
    if not followed_camera or Engine.is_editor_hint():
        viewport_camera.transform.origin = POSITION
        viewport_camera.rotation_degrees = ROTATION

    if not Engine.is_editor_hint() and followed_camera:
        viewport_camera.fov = followed_camera.fov
        viewport_camera.rotation = followed_camera.rotation
        viewport_camera.transform = followed_camera.transform
