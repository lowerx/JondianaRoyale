extends KinematicBody2D

var hp = 0
var speed = 0
var damage = 0.00
var attackRate : float = 0.0
var attackDist : int = 0
var chaseDist : int = 0
var enemy_scale = 1

var xpToGive : int = 30

var enemy_name = ""

var death_animation : bool = false

onready var timer = $Timer
onready var DeathTimer = $DeathTimer


func _ready ():
	
	timer.wait_time = attackRate
	timer.start()


func _process(delta):
	
	if not self.death_animation:
		
		$AnimatedEnemy.play(enemy_name + "_stay")
		
		if not AutoLoad._game_scene:
		
			queue_free()
			
		if self.hp <= 0:
			
			die()


func _physics_process (delta):
	
	if not AutoLoad._game_scene:
		
		queue_free()
	
	elif not self.death_animation:
	
		$AnimatedEnemy.play(self.enemy_name + "_run")
		
		var dist = position.distance_to(AutoLoad.target.position)
		
		if dist > attackDist and dist < chaseDist:
			
			var vel = (AutoLoad.target.position - position).normalized()
			move_and_slide(vel * speed)


func _on_Timer_timeout():
	
	if position.distance_to(AutoLoad.target.position) <= attackDist:
		
		AutoLoad.target.take_damage(damage)
		
		timer.start()


func die ():
	
	self.death_animation = true
	
	AutoLoad.target.give_xp(xpToGive)
	
	$AnimatedEnemy.play(enemy_name + "_death")
	
	DeathTimer.start()


func _on_Area2D_area_entered(area):
	
	if area.is_in_group("bullets"):
		
		self.hp -= AutoLoad.gun["damage"]
		
		area.queue_free()


func _on_DeathTimer_timeout():
	
	queue_free()
