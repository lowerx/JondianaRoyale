extends Camera2D


onready var target = get_node("/root/TestingLevel/Player")

func _process (delta):
	
	position = target.position
