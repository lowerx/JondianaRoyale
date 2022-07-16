extends Area2D

export var goldToGive : int = 5
export var xpToGive : int = 5


func on_interact (player):
	player.give_gold(goldToGive)
	player.give_xp(xpToGive)
	queue_free()
