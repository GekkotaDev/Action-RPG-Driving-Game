class_name VehicleTransmission extends Resource

var _current_gear = 0

@export var final_drive_ratio: float
@export var reverse_ratio: float
@export var gear_ratios: Array[float]

@export var current_gear: int:
    get():
        return _current_gear

    set(gear):
        if gear < -1: return
        if gear >= gear_ratios.size(): return
        _current_gear = gear
