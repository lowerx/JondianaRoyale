tool
extends Button

export(String, FILE) var next_scene_path: = ""


func _get_configuration_warning() -> String:
	
	return "next_scene path must not be empty!" if next_scene_path == "" else ""


func _on_PlayButton_button_up():
	
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)
