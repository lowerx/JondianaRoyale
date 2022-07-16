extends Node2D

var timing = 0
var final_number = 0


onready var timer = $Timer


func getting_initial(final_number, timing):
	self.final_number = final_number
	self.timing = timing


func start_rolling():
	# the animation stuff to add(start rolling)
	timer.wait_time = timing
	timer.start()


func _on_Timer_timeout():
	# end the animation and show the number
	pass
