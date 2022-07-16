extends KinematicBody2D

var curHp : int = 10
export var maxHp : int = 10
export var moveSpeed : int = 250
var fire_time = 0.0

var gold : int = 0
var curLevel : int = 0
var curXp : int = 0
var xpToNextLevel : int = 50
var xpToLevelIncreaseRate : float = 1.2
var interactDist : int = 70
var vel = Vector2()
var facingDir = Vector2()

var gun = null

signal player_fired_bullet(bullet, position, direction)
signal player_fired_explosion(explosion, position, direction)

onready var rayCast = $RayCast2D
onready var ui = get_node("/root/TestingLevel/UICanvasLayer/UI")

onready var bullet_path = preload("res://src/Objects/Bullet.tscn")
onready var explosion_path = preload("res://src/Objects/Explosion.tscn")
onready var end_of_gun = $FirePoint/EndOfGun
onready var gun_path = preload("res://src/Objects/Gun/Gun.tscn")


func _ready ():
	
	ui.update_level_text(curLevel)
	ui.update_health_bar(curHp, maxHp)
	ui.update_xp_bar(curXp, xpToNextLevel)
	ui.update_gold_text(gold)
	
	get_gun()


func get_gun():
	
	gun = gun_path.instance()
	add_child(gun)
	gun.global_position = end_of_gun.global_position


func _physics_process (delta):
  
	vel = Vector2()
  
	if Input.is_action_pressed("up"):
		
		vel.y -= 1
		facingDir = Vector2(0, -1)
		
	if Input.is_action_pressed("down"):
		
		vel.y += 1
		facingDir = Vector2(0, 1)
		
	if Input.is_action_pressed("left"):
		
		vel.x -= 1
		facingDir = Vector2(-1, 0)
		
	if Input.is_action_pressed("right"):
		
		vel.x += 1
		facingDir = Vector2(1, 0)
	
  
	vel = vel.normalized()
  
	move_and_slide(vel * moveSpeed, Vector2.ZERO)
	
	ui.update_gold_text(gold)

	ui.update_level_text(curLevel)

	ui.update_xp_bar(curXp, xpToNextLevel)

	ui.update_health_bar(curHp, maxHp)


func give_gold (amount):
	
	gold += amount


func give_xp (amount):
	
	curXp += amount
	
	if curXp >= xpToNextLevel:
		
		level_up()


func level_up ():
	
	var overflowXp = curXp - xpToNextLevel
	xpToNextLevel *= xpToLevelIncreaseRate
	curXp = overflowXp
	curLevel += 1


func take_damage (dmgToTake):
	
	curHp -= dmgToTake
	
	if curHp <= 0:
		
		ui.update_health_bar(curHp, maxHp)
		AutoLoad.not_game_scene()
		die()


func die ():
	
	queue_free()
	get_tree().change_scene("res://src/UI/QuitTheLevel/YouDiedScreen.tscn")


func _process (delta):
	
	if Input.is_action_just_pressed("interact"):
		
		try_interact()
		
	if Input.is_action_pressed("shoot"):
		
		print("FUST: ", AutoLoad.gun)
		
		if AutoLoad.gun["shotability"]:
		
			shoot()
		
		else:
			
			beat()
		
	$FirePoint.look_at(get_global_mouse_position())


func get_time():
	
	return OS.get_ticks_msec() / 1000


func try_interact ():
	
	rayCast.cast_to = facingDir * interactDist
	
	if rayCast.is_colliding():
		
		if rayCast.get_collider() is KinematicBody2D:
			
			rayCast.get_collider().take_damage(AutoLoad.gun["damage"])
			
		elif rayCast.get_collider().has_method("on_interact"):
			
			rayCast.get_collider().on_interact(self)


func shoot():
	
	if get_time() - fire_time < AutoLoad.gun["fire_rate"]:
		
		return
		
	fire_time = get_time()
	var bullet = bullet_path.instance()
	var direction = (get_global_mouse_position() - end_of_gun.global_position).normalized()
	emit_signal("player_fired_bullet", bullet, end_of_gun.global_position, direction)


func beat():
	
	if get_time() - fire_time < AutoLoad.gun["fire_rate"]:
		return
		
	fire_time = get_time()
	var explosion = explosion_path.instance()
	var direction = (get_global_mouse_position() - end_of_gun.global_position).normalized()
	emit_signal("player_fired_explosion", explosion, end_of_gun.global_position, direction)
