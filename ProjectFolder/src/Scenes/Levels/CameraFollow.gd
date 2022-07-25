extends Camera2D


onready var target = get_node("/root/LevelScene/Level/Player")


func _process (delta):
	
	if AutoLoad._game_scene:
	
		position = target.position
