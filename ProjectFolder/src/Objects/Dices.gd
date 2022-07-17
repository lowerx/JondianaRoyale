extends Node2D

var timing = 0
var final_ability = 0
var final_gun = 0
var final_enemies = 0
var raw = "ability"


onready var AbilityTimer = $AbilityTimer
onready var GunTimer = $GunTimer
onready var EnemiesTimer = $EnemiesTimer
export(String, FILE) var next_scene_path: = ""


func getting_initial(ability, gun, enemies, timing):
	
	self.final_ability = ability
	self.final_gun = gun
	self.final_enemies = enemies
	self.timing = timing


func _process(delta):
	
	if Input.is_action_just_released("next") and self.raw == "ability":
		
		roll_the_ability()
		roll_the_gun()
		roll_the_enemies()
	
	elif Input.is_action_just_released("next") and self.raw == "play":
		
		get_tree().change_scene(next_scene_path)


func roll_the_ability():
	
	AbilityTimer.start(self.timing)
	$AbilityDice.play("ability_dices")


func _on_AbilityTimer_timeout():
	
	$AbilityDice.stop()
	$AbilityDice.set_frame(self.final_ability)
	
	self.raw = "gun"


func roll_the_gun():
	
	GunTimer.start(self.timing)
	$GunDice.play("gun_dices")


func _on_GunTimer_timeout():
	
	$GunDice.stop()
	$GunDice.set_frame(self.final_gun)
	
	self.raw = "enemies"


func roll_the_enemies():
	
	EnemiesTimer.start(self.timing)
	$EnemiesDice.play("enemies_dices")


func _on_EnemiesTimer_timeout():
	
	$EnemiesDice.stop()
	$EnemiesDice.set_frame(self.final_enemies)
	
	self.raw = "play"
