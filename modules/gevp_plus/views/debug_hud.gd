extends Control


@export var vehicle: Vehicle


@onready var speed_label = $"VBoxContainer/Speed" as Label
@onready var rpm_label = $"VBoxContainer/RPM" as Label
@onready var gear_label = $"VBoxContainer/Gear" as Label


func _physics_process(_delta: float) -> void:
    var speed_kmh = round(vehicle.speed * 3.6)
    var rpm = round(vehicle.motor_rpm)

    speed_label.text = "{speed} km/h".format({"speed": speed_kmh})
    rpm_label.text = "{rpm} rpm".format({"rpm": rpm})
    gear_label.text = "{gear}".format({"gear": vehicle.current_gear})
