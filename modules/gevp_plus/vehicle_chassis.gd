extends Vehicle

@export var camera: Camera3D
@export var middlewares: Array[VehicleMiddleware]


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
    super (state)

    for middleware in middlewares:
        middleware.integrate_forces(state)


func _physics_process(delta: float) -> void:
    super (delta)

    for middleware in middlewares:
        middleware.process_vehicle(self, camera, delta)
