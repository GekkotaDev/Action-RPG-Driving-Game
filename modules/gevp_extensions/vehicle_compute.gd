class_name VehicleCompute


static func compute_rpm(vehicle: Vehicle) -> int:
    return round(vehicle.motor_rpm)


static func compute_speed_kmh(vehicle: Vehicle) -> int:
    return round(vehicle.speed * 3.6)


static func compute_speed_mph(vehicle: Vehicle) -> int:
    return round(vehicle.speed * 3.6 * 0.621371)
