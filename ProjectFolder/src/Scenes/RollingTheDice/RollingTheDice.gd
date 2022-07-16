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
	
	if ABILITIES_LIST[AbilitiesRandom - 1] != null:
			
		AutoLoad.ability["name"] = ABILITIES_LIST[AbilitiesRandom - 1]
	
	if GUNS_LIST[GunRandom - 1] != null:
			
		AutoLoad.gun["name"] = GUNS_LIST[GunRandom - 1]
		create_gun(GUNS_LIST[GunRandom - 1])
	
	for enemy in range(0, len(ENEMIES_LIST)):
		
		if ENEMIES_LIST[enemy] != null:
			
			if EnemiesRandom - 1 == enemy:
				
				AutoLoad.enemies_numbers.append({ "name": ENEMIES_LIST[enemy], "amount": round(AutoLoad.level * 60 / 100) })
				
			else:
				
				AutoLoad.enemies_numbers.append({ "name": ENEMIES_LIST[enemy], "amount": round(AutoLoad.level * 6 / 100) })
				
	print(AbilitiesRandom)
	print(GunRandom)
	print(EnemiesRandom)


func create_gun(name):
	
	if name == 'sword':
		
		_complete_gun(80.0, 4.0, 4.0, false)
	
	elif name == 'shotgun':
		
		_complete_gun(50.0, 5.0, 2.0, true, 0.5)
		
	elif name == 'fists':
		
		_complete_gun(30.0, 2.0, 1.0, false)
		
	elif name == 'rifle':
		
		_complete_gun(40.0, 2.0, 3.0, true, 1.0)
		
	elif name == 'sniper':
		
		_complete_gun(100.0, 1.0, 5.0, true, 2.0)
		
	elif name == 'bow':
		
		_complete_gun(70.0, 3.0, 2.0, true, 1.0)


func _complete_gun(damage, damage_range, periods_between_shots, shotability, bullet_timer=0.1):
	
	AutoLoad.gun["damage"] = damage
	AutoLoad.gun["damage_range"] = damage_range
	AutoLoad.gun["fire_rate"] = periods_between_shots
	AutoLoad.gun["shotability"] = shotability
	AutoLoad.gun["bullet_timer"] = bullet_timer
