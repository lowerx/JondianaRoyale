extends Node2D

onready var rolling_the_dice = $RollingTheDice


func _ready():
	rolling_the_dice.roll_the_dices()
	
	AutoLoad.game_scene()
