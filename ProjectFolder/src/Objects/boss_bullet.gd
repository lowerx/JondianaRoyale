extends Area2D


var move = Vector2.ZERO
var look_vector = Vector2.ZERO
var player = null
var speed = 3

func _ready() -> void:
	look_vector = player.position - global_position

func _physics_process(delta: float) -> void:
	move = Vector2.ZERO
	
	move = move.move_toward(look_vector, delta)
	move = move.normalized() * speed
	position += move
