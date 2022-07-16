extends Node2D

var AbilitiesRandom = RandomNumberGenerator.new()
var GunRandom = RandomNumberGenerator.new()
var EnemiesRandom = RandomNumberGenerator.new()

onready var ABILITIES_LIST = [
	"invincibility",
	"swimming",
	"walls",
	"extra_hp",
	"dash",
	"speed"
]
onready var GUNS_LIST = [
	"sword",
	"shotgun",
	"rifle",
	"sniper",
	"fists",
	"bow"
]
onready var ENEMIES_LIST = [
	"snake",
	"mummy",
	"tribesman",
	"treasure_hunter",
	"witch",
	"skeleton"
]


func _ready():
	
	AbilitiesRandom.randomize()
	GunRandom.randomize()
	EnemiesRandom.randomize()


func roll_the_dices():
	
	AbilitiesRandom = AbilitiesRandom.randi_range(1, 6)
	GunRandom = GunRandom.randi_range(1, 6)
	EnemiesRandom = EnemiesRandom.randi_range(1, 6)
	
	for ability in range(0, len(ABILITIES_LIST)):
		
		if ABILITIES_LIST[ability] != null:
			
			if AbilitiesRandom - 1 == ability:
				
				AutoLoad.abilities.append(ABILITIES_LIST[ability])
	
	for gun in range(0, len(GUNS_LIST)):
		
		if GUNS_LIST[gun] != null:
			
			if GunRandom - 1 == gun:
			
				AutoLoad.guns.append(GUNS_LIST[gun])
	
	for enemy in range(0, len(ENEMIES_LIST)):
		
		if ENEMIES_LIST[enemy] != null:
			
			if EnemiesRandom - 1 == enemy:
				
				AutoLoad.enemies_numbers.append({ "name": ENEMIES_LIST[enemy], "amount": round(AutoLoad.level * 60 / 100) })
				
			else:
				
				AutoLoad.enemies_numbers.append({ "name": ENEMIES_LIST[enemy], "amount": round(AutoLoad.level * 6 / 100) })
				
	print(AbilitiesRandom)
	print(GunRandom)
	print(EnemiesRandom)
