extends KinematicBody2D

var hp = 0
var maxHp = 0
var speed = 0
var damage = 0.00
var attackRate : float = 0.0
var attackDist : int = 0
var chaseDist : int = 0
var enemy_scale = 1

var xpToGive : int = 30

var enemy_name = ""

onready var target = get_node("/root/TestingLevel/Player")
onready var timer = $Timer


func _ready ():
	
	timer.wait_time = attackRate
	timer.start()


func _process(delta):
	
	$AnimatedEnemy.play(enemy_name + "_stay")
	
	if not AutoLoad._game_scene:
		
		queue_free()
		
	if self.hp <= 0:
		
		die()


func _physics_process (delta):
	
	$AnimatedEnemy.play(self.enemy_name + "_run")
	
	var dist = position.distance_to(target.position)
	
	if dist > attackDist and dist < chaseDist:
		
		var vel = (target.position - position).normalized()
		move_and_slide(vel * speed)


func _on_Timer_timeout():
	
	if position.distance_to(target.position) <= attackDist:
		
		target.take_damage(damage)


func die ():
	
	target.give_xp(xpToGive)
	
	$AnimatedEnemy.play(enemy_name + "_death")
	
	queue_free()


func _on_Area2D_area_entered(area):
	
	if area.get_name() == "Bullet":
		
		self.hp -= AutoLoad.gun["damage"]
