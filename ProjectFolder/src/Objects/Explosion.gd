extends Area2D
#class_name Bullet

export (int) var speed: = 10

onready var kill_timer = $KillTimer

var direction = Vector2.ZERO
var damage = 0


func _ready() -> void:
	kill_timer.start(AutoLoad.gun["bullet_timer"])


func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity


func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_KillTimer_timeout() -> void:
	
	queue_free()


func _on_BulletArea_body_entered(body):
	
	if not body.is_in_group("player"):
		
		hide()
		queue_free()


func _on_BulletArea_area_entered(area):
	
	if not area.is_in_group("player"):
		
		hide()
		queue_free()
	
