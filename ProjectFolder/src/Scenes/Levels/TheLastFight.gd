extends Node2D

onready var bullet_manager = $Bullet_manager
onready var player = $Player


onready var rolling_the_dice = $RollingTheDice
onready var enemy_path = preload("res://src/Actors/Enemies/Enemy.tscn")

#var projectResolution = OS.get_screen_size()
var projectResolution = Vector2(800, 800)


func _ready():
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	player.connect("player_fired_explosion", bullet_manager, "handle_explosion_spawned")
	
	AutoLoad.game_scene()
	
	for enemy in AutoLoad.enemies_numbers:
		
		var enemy_object = enemy_path.instance()
			
		enemy_object.enemy_name = enemy["name"]
		
		var stats = get_the_player(enemy["name"], enemy_object)
		
		for number in range(0, enemy["amount"]):
			
			var enemy_position = null
			
			while true:
				
				var random_position = RandomNumberGenerator.new()
				random_position.randomize()
				enemy_position = Vector2(random_position.randi_range(0, projectResolution.x), random_position.randi_range(0, projectResolution.y))
				var distance_to_player = enemy_position.distance_to(player.position)
				
				if distance_to_player >= 500:
					
					break
			
			get_tree().get_root().add_child(enemy_object)
			enemy_object.global_position = enemy_position
			enemy_object.hp = stats["hp"]
			enemy_object.speed = stats["speed"]
			enemy_object.damage = stats["damage"]
			enemy_object.attackRate = stats["attack_rate"]
			enemy_object.attackDist = stats["attack_distance"]
			enemy_object.chaseDist = stats["chase_distance"]
			enemy_object.scale = Vector2(stats["enemy_scale"], stats["enemy_scale"])
		
			AutoLoad.enemies.append(enemy_object)


func get_the_player(name, enemy_object):
	
	var stats = {}
	
	if name == "snake":
		
		stats["hp"] = 10
		stats["speed"] = 400
		stats["damage"] = 1
		stats["attack_rate"] = 1.0
		stats["attack_distance"] = 20
		stats["chase_distance"] = 200
		stats["enemy_scale"] = 1.0 / 10.0
		
	elif name == "mummy":
		
		stats["hp"] = 25
		stats["speed"] = 100
		stats["damage"] = 2
		stats["attack_rate"] = 3.0
		stats["attack_distance"] = 30
		stats["chase_distance"] = 250
		stats["enemy_scale"] = 1.0 / 4.0
	
	elif name == "tribesman":
		
		stats["hp"] = 30
		stats["speed"] = 150
		stats["damage"] = 3
		stats["attack_rate"] = 2.0
		stats["attack_distance"] = 35
		stats["chase_distance"] = 300
		stats["enemy_scale"] = 1.0 / 4.0
	
	elif name == "treasure_hunter":
		
		stats["hp"] = 40
		stats["speed"] = 200
		stats["damage"] = 4
		stats["attack_rate"] = 2.0
		stats["attack_distance"] = 40
		stats["chase_distance"] = 400
		stats["enemy_scale"] = 1.0 / 4.0
	
	elif name == "witch":
		
		stats["hp"] = 50
		stats["speed"] = 240
		stats["damage"] = 5
		stats["attack_rate"] = 1.5
		stats["attack_distance"] = 50
		stats["chase_distance"] = 400
		stats["enemy_scale"] = 1.0 / 8.0
	
	elif name == "skeleton":
		
		stats["hp"] = 20
		stats["speed"] = 220
		stats["damage"] = 2
		stats["attack_rate"] = 2.0
		stats["attack_distance"] = 30
		stats["chase_distance"] = 300
		stats["enemy_scale"] = 1.0 / 4.0
	
	return stats
			
