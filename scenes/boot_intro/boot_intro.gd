extends Control

@export var splash_player: AnimationPlayer


func _ready() -> void:
    splash_player.play("boot_splash")


func _on_boot_intro_finish(_anim_name: StringName) -> void:
    SceneManager.change_scene(preload("res://scenes/title_screen/title_screen.tscn"))
