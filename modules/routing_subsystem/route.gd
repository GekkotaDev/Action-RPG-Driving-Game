class_name Route extends Control

signal _route_popped()


func _on_child_pop():
    transition_in()


func pop_route():
    transition_out()
    _route_popped.emit()


func push_route(scene: Route):
    var view = $View as Control

    if not scene._route_popped.is_connected(_on_child_pop):
        scene._route_popped.connect(_on_child_pop)

    view.visible = false
    scene.visible = true


func transition_in():
    var view = $View as Control
    view.visible = true


func transition_out():
    visible = false
