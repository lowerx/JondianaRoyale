extends Node2D

var FirstRandom = RandomNumberGenerator.new()
var SecondRandom = RandomNumberGenerator.new()
var ThirdRandom = RandomNumberGenerator.new()


func _ready():
	FirstRandom.randomize()
	SecondRandom.randomize()
	ThirdRandom.randomize()


func roll_the_dices():
	FirstRandom = FirstRandom.randi_range(1, 6)
	SecondRandom = SecondRandom.randi_range(1, 6)
	ThirdRandom = ThirdRandom.randi_range(1, 6)
	print(FirstRandom)
	print(SecondRandom)
	print(ThirdRandom)
