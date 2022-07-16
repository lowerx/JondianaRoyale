extends Node2D

onready var bullet_manager = $Bullet_manager
onready var player = $Player


onready var rolling_the_dice = $RollingTheDice
onready var enemy_path = preload("res://src/Actors/Enemies/Enemy.tscn")

#var projectResolution = OS.get_screen_size()
var projectResolution = Vector2(800, 800)


func _ready():
	rolling_the_dice.roll_the_dices()
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	
	AutoLoad.game_scene()
	
	for enemy in AutoLoad.enemies_numbers:
		
		var enemy_object = enemy_path.instance()
		
		print(enemy["amount"])
		for number in range(0, enemy["amount"]):
			
			var random_position = RandomNumberGenerator.new()
			random_position.randomize()
			var enemy_position = Vector2(random_position.randi_range(0, projectResolution.x), random_position.randi_range(0, projectResolution.y))
			
			get_tree().get_root().add_child(enemy_object)
			enemy_object.global_position = enemy_position
			
			AutoLoad.enemies.append(enemy_object)
			print(enemy_object.global_position)
			
