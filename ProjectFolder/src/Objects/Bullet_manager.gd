extends Node2D


func handle_bullet_spawned(bullet, position, direction):
	add_child(bullet)
	bullet.global_position = position
	bullet.damage = AutoLoad.gun["damage"]
	bullet.set_direction(direction)


func handle_explosion_spawned(explosion, position, direction):
	add_child(explosion)
	explosion.global_position = position
	explosion.damage = AutoLoad.gun["damage"]
	explosion.set_direction(direction)
