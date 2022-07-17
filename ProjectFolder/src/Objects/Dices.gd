extends Node2D

var timing = 0
var final_ability = 0
var final_gun = 0
var final_enemies = 0


onready var AbilityTimer = $AbilityTimer
onready var GunTimer = $GunTimer
onready var EnemiesTimer = $EnemiesTimer


func getting_initial(ability, gun, enemies, timing):
	
	self.final_ability = ability
	self.final_gun = gun
	self.final_enemies = enemies
	self.timing = timing


func _process(delta):
	
	if Input.is_action_just_released("next"):
		
		roll_the_ability()


func roll_the_ability():
	
	AbilityTimer.start(self.timing)
	$AbilityDice.play("ability_dices")


func _on_AbilityTimer_timeout():
	
	$AbilityDice.stop()
	$AbilityDice.set_frame(self.final_ability)
	
	if Input.is_action_just_released("next"):
		
		roll_the_gun()


func roll_the_gun():
	
	GunTimer.start(self.timing)
	$GunDice.play("gun_dices")


func _on_GunTimer_timeout():
	
	$GunDice.stop()
	$GunDice.set_frame(self.final_gun)
	
	if Input.is_action_just_released("next"):
		
		roll_the_enemies()


func roll_the_enemies():
	
	EnemiesTimer.start(self.timing)
	$EnemiesDice.play("enemies_dices")


func _on_EnemiesTimer_timeout():
	
	$EnemiesDice.stop()
	$EnemiesDice.set_frame(self.final_enemies)
