extends Area2D


var move = Vector2.ZERO
var look_vector = Vector2.ZERO
var speed = 3

onready var target = get_node("/root/TheLastFight/Player")


func _ready() -> void:
	look_vector = target.position - global_position


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


func _on_KillTimer_timeout():
	
	queue_free()
