extends Node2D

var gun_name = ""


func set_name(name):
	
	self.gun_name = name
	$AnimatedGun.play(self.gun_name + "_static")


func fire():
	
	$AnimatedGun.play(self.gun_name + "_fire")

