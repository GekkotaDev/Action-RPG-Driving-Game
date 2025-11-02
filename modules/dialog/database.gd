class_name DialogCollectionsDatabase extends Resource

@export var collections: Array[DialogStory] = []

const foo = preload("res://scenes/init/init.torch")

func _init() -> void:
    var inst = foo.new()
    inst.Prompt()
    print("it works")
