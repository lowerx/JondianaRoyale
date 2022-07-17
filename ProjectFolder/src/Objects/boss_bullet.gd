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


func _on_BulletArea_body_entered(body):
	
	if not body.is_in_group("boss"):
		
		hide()


func _on_BulletArea_area_entered(area):
	
	if not area.is_in_group("boss"):
		
		hide()
