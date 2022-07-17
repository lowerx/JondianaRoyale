extends KinematicBody2D

var curHp : int = 50
var maxHp : int = 50
var moveSpeed : int = 80
var xpToGive : int = 90
var damage : int = 4
var attackRate : float = 1.0

var move = Vector2.ZERO

#var attackDist : int = 100
#var chaseDist : int = 800

var player = null
onready var target = get_node("/root/TestingLevel/Player")
onready var timer = $Timer


onready var bullet_path = preload("res://src/Objects/boss_bullet.tscn")

func _ready ():
	pass

func _process(delta):
	
	if not AutoLoad._game_scene:
		queue_free()
	if curHp <= 0:
		die()

func _physics_process (delta):
	move = Vector2.ZERO
	
	if player != null:
		
		move = position.direction_to(player.position) * moveSpeed
	
	else:
		
		move = Vector2.ZERO
	
	move = move.normalized()
	move = move_and_collide(move)

func shoot():
	var bullet = bullet_path.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$ShootTimer.set_wait_time(1)


func die ():
	target.give_xp(xpToGive)
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	curHp -= AutoLoad.gun["damage"]


func _on_ShootTimer_timeout() -> void:
	if player != null:
		shoot()
