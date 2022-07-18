extends KinematicBody2D

var hp = 1000
var maxHp = 1000
var speed = 80
var attackRate = 3.0

export(String, FILE) var next_scene_path: = ""

var xpToGive : int = 90

var move = Vector2.ZERO

var attackDist : int = 1000
var chaseDist : int = 800

var dead : bool = false

onready var target = get_node("/root/TestingLevel/Player")
onready var ShootTimer = $ShootTimer
onready var DeathTimer = $DeathTimer


onready var bullet_path = preload("res://src/Objects/boss_bullet.tscn")


func _ready ():
	
	ShootTimer.wait_time = attackRate
	ShootTimer.start()


func _process(delta):
	
	if not self.dead:
		
		$AnimatedBoss.play("stay")
	
		if not AutoLoad._game_scene:
			
			queue_free()
			
		if hp <= 0:
			
			die()


func _physics_process (delta):
	
	if not self.dead:
		
		$AnimatedBoss.play("run")
			
		var dist = position.distance_to(self.target.position)
		
		if dist > self.attackDist and dist < self.chaseDist:
			
			var vel = (self.target.position - position).normalized()
			move_and_slide(vel * speed)


func shoot():
	
	var bullet = bullet_path.instance()
	bullet.position = get_global_position()
	get_parent().add_child(bullet)
	$ShootTimer.set_wait_time(1)


func die ():
	
	self.dead = true
	
	target.give_xp(xpToGive)
	
	$AnimatedBoss.play("death")
	
	DeathTimer.start()


func _on_Area2D_area_entered(area: Area2D) -> void:
	
	hp -= AutoLoad.gun["damage"]


func _on_ShootTimer_timeout() -> void:
	
	if position.distance_to(self.target.position) <= self.attackDist:
		
		shoot()


func _on_DeathTimer_timeout():
	
	AutoLoad.reset_values()
	get_tree().change_scene(next_scene_path)
	
	queue_free()
