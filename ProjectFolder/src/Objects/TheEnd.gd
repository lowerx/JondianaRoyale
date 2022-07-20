extends Node2D


export(String, FILE) var next_scene_path: = ""


func _on_TheEnd_body_entered(body):
	
	AutoLoad.reset_values()
	get_tree().change_scene(next_scene_path)
	
	queue_free()
