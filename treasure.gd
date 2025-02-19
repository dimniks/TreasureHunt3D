extends Area3D

@export var main_scene: NodePath 

func _on_body_entered(body):
	if body is CharacterBody3D:
		var scene = get_node(main_scene)  
		if scene and scene.has_method("collect_treasure"):
			scene.collect_treasure()
			queue_free()  
