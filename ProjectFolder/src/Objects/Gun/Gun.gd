extends Node2D

var damage = 0
var damage_range = 0
var seconds_between_shots = 0
var shotability = null
var bullet_timer = null
var animations = null


func _init(name):
	
	if name == 'sword':
		
		_complete_item(80, 4, 4, false)
	
	elif name == 'shotgun':
		
		_complete_item(50, 5, 2, true, 0.5)
		
	elif name == 'fists':
		
		_complete_item(30, 2, 1, false)
		
	elif name == 'rifle':
		
		_complete_item(40, 2, 3, true, 1)
		
	elif name == 'sniper':
		
		_complete_item(100, 1, 5, true, 2)
		
	elif name == 'bow':
		
		_complete_item(70, 3, 2, true, 1)


func _complete_item(damage, damage_range, periods_between_shots, shotability, animations=null, bullet_timer=null):
	
	self.damage = damage
	self.damage_range = damage_range
	self.periods_between_shots = periods_between_shots
	self.shotability = shotability
	self.bullet_timer = bullet_timer
	self.animations = animations
