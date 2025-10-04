class_name Route extends Control

signal route_popped()


func _on_child_pop():
    var view = $View as Control
    
    view.visible = true


func pop_route():
    visible = false
    route_popped.emit()


func route_to(scene: Route):
    var view = $View as Control
    var route = scene

    view.visible = false
    route.visible = true

    if not route.route_popped.is_connected():
        route.route_popped.connect(_on_child_pop)
