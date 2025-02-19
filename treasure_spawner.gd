extends Node3D

@export var treasure_scene: PackedScene
@export var num_treasures = 10

func _ready():
	var park_objects = get_parent().get_node("ParkEnvironment").get_children()
	for i in range(num_treasures):
		var treasure = treasure_scene.instantiate()
		var random_object = park_objects[randi() % park_objects.size()]
		treasure.position = random_object.position + Vector3(randf_range(-1, 1), 0.5, randf_range(-1, 1))
		
		# Ова ја поврзува секоја инстанца на Treasure со MainScene
		treasure.main_scene = get_path_to(get_tree().current_scene)

		add_child(treasure)
