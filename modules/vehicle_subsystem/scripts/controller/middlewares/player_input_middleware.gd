extends VehicleInputMiddleware


func from_input(vehicle: Vehicle) -> void:
    vehicle.throttle_input = pow(Input.get_action_strength("vehicle_throttle"), 2.0)
    vehicle.brake_input = Input.get_action_strength("vehicle_brake")
    vehicle.steering_input = \
        Input.get_action_strength("vehicle_steer_left") \
        - Input.get_action_strength("vehicle_steer_right")
    vehicle.handbrake_input = Input.get_action_strength("vehicle_handbrake")
    vehicle.clutch_input = clampf(
        Input.get_action_strength("vehicle_clutch") + Input.get_action_strength("vehicle_handbrake"),
        0.0,
        1.0,
    )
    
    if Input.is_action_just_pressed("vehicle_shift_down"):
        vehicle.manual_shift(-1)

    if Input.is_action_just_pressed("vehicle_shift_up"):
            vehicle.manual_shift(1)

    if Input.is_action_just_pressed("vehicle_toggle_transmission"):
        vehicle.automatic_transmission = not vehicle.automatic_transmission
