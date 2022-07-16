extends Node2D

var AbilitiesRandom = RandomNumberGenerator.new()
var GunRandom = RandomNumberGenerator.new()
var EnemiesRandom = RandomNumberGenerator.new()


func _ready():
	AbilitiesRandom.randomize()
	GunRandom.randomize()
	EnemiesRandom.randomize()


func roll_the_dices():
	AbilitiesRandom = AbilitiesRandom.randi_range(1, 6)
	GunRandom = GunRandom.randi_range(1, 6)
	EnemiesRandom = EnemiesRandom.randi_range(1, 6)
	print(AbilitiesRandom)
	print(GunRandom)
	print(EnemiesRandom)
