class_name VehicleInputController extends Node3D

@export var input_middleware: Array[VehicleInputMiddleware]
@export var vehicle: Vehicle


func _physics_process(_delta):
    for middleware in input_middleware:
        middleware.from_input(vehicle)
