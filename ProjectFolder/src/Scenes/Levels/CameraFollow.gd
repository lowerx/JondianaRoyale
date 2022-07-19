extends Camera2D


<<<<<<< HEAD
onready var target = get_node("/root/TestingLevel/Player")

=======
onready var target = get_node("/root/TheLastFight/Player")
>>>>>>> 4863737105ee1b3e7ab196c8fe4666cc48f4ec70
func _process (delta):
	
	position = target.position
