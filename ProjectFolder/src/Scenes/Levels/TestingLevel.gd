extends Node2D

onready var rolling_the_dice = $RollingTheDice
#var projectResolution = OS.get_screen_size()
var projectResolution = Vector2(800, 800)

func _ready():
	rolling_the_dice.roll_the_dices()
	
	AutoLoad.game_scene()
	
	for enemy in AutoLoad.enemies_numbers:
		
		var Enemy = load(enemy["node"]).instance()
		
		print(enemy["amount"])
		for number in range(0, enemy["amount"]):
			
			var random_position = RandomNumberGenerator.new()
			random_position.randomize()
			var enemy_position = Vector2(random_position.randi_range(0, projectResolution.x), random_position.randi_range(0, projectResolution.y))
			
			get_tree().get_root().add_child(Enemy)
			Enemy.global_position = enemy_position
			
			AutoLoad.enemies.append(Enemy)
			print(Enemy.global_position)
			
