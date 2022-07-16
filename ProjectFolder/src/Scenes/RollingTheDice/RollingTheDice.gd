extends Node2D

var AbilitiesRandom = RandomNumberGenerator.new()
var GunRandom = RandomNumberGenerator.new()
var EnemiesRandom = RandomNumberGenerator.new()

onready var ABILITIES_LIST = [null, null, null, null, null, null]
onready var GUNS_LIST = [null, null, null, null, null, null]
onready var ENEMIES_LIST = [
	"res://src/Actors/Enemies/Enemy.tscn",
	"res://src/Actors/Enemies/Enemy.tscn",
	"res://src/Actors/Enemies/Enemy.tscn",
	"res://src/Actors/Enemies/Enemy.tscn",
	"res://src/Actors/Enemies/Enemy.tscn",
	"res://src/Actors/Enemies/Enemy.tscn"
]


func _ready():
	AbilitiesRandom.randomize()
	GunRandom.randomize()
	EnemiesRandom.randomize()


func roll_the_dices():
	
	AbilitiesRandom = AbilitiesRandom.randi_range(1, 6)
	GunRandom = GunRandom.randi_range(1, 6)
	EnemiesRandom = EnemiesRandom.randi_range(1, 6)
	
	for enemy in range(0, len(ENEMIES_LIST)):
		
		if ENEMIES_LIST[enemy] != null:
			
			if EnemiesRandom - 1 == enemy:
				print("FOUND")
				print(AutoLoad.level * 60 / 100)
				
				AutoLoad.enemies_numbers.append({ "node": ENEMIES_LIST[EnemiesRandom - 1], "amount": round(AutoLoad.level * 60 / 100) })
				
			else:
				
				AutoLoad.enemies_numbers.append({ "node": ENEMIES_LIST[EnemiesRandom - 1], "amount": round(AutoLoad.level * 6 / 100) })
				
	print(AbilitiesRandom)
	print(GunRandom)
	print(EnemiesRandom)
