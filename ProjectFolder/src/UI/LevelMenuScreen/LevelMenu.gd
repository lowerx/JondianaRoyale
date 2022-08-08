extends Control


var level_number = AutoLoad.level_number

onready var number_label = $LevelNumber/NumberLayer/NumberLabel


func _process(delta):
	
	number_label.text = str(level_number)


func _on_BackButton_pressed():
	
	self.level_number -= 1


func _on_ForwardButton_pressed():
	
	self.level_number += 1
