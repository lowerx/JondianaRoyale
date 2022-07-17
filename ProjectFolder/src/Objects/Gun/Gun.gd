extends Node2D

var gun_name = ""


func set_name(name):
	
	self.gun_name = name
	$AnimatedGun.rotation_degrees = 270
	$AnimatedGun.set_frame(0)


func fire():
	
	$AnimatedGun.play(self.gun_name + "_fire")
	

