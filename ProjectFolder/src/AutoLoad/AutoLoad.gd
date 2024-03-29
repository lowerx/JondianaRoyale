extends Node

signal update

export var time = 0.00

const SAVE_FILE_PATH := "user://game.save"

var start = true
var _game_scene = false

var level_number = 1

var location = {
	"bushes": 0.00,
	"trees": 0.00
}

var level = 0.0
var score = 0.0
var gametime = 0.0

var ability = {
	"name": null
}

var gun = {
	"name": "",
	"damage": 0.00,
	"damage_range": 0.00,
	"fire_rate": 0.00,
	"shotability": null,
	"bullet_timer": null
}

var enemies_numbers = []
var enemies = []

var boss_hp = 100
var boss_dmg = 5

var target = null

var player_dead : bool = false


func _ready():
	
	randomize()
	
	self.load_save()


func game_scene():
	
	_game_scene = true
	
	self.boss_hp = max(100 * self.level, 1500)
	self.boss_dmg = max(5 + self.level * 2, 50.0)


func not_game_scene():
	
	_game_scene = false


func save(level, score=null, gametime=null):
	
	var save_data := {}
	
	save_data["level"] = level
	save_data["score"] = score
	save_data["gametime"] = time
	
	var data_as_string := var2str(save_data)
	
	var file := File.new()
	
	file.open(SAVE_FILE_PATH, File.WRITE)
	file.store_string(data_as_string)
	file.close()


func load_save():
	
	var file := File.new()
	
	file.open(SAVE_FILE_PATH, File.READ)
	
	var check = file.get_as_text()
	
	if len(check) > 0:
	
		var data : Dictionary = str2var(file.get_as_text())
		
		file.close()
		
		self.level = data["level"]
		self.score = data["score"]
		self.gametime = data["gametime"]
	
	else:
		
		file.close()


func reset_values():
	
	get_tree().paused = false
	
	self.location = {
		"bushes": 0.00,
		"trees": 0.00
	}

	self.ability = {
		"name": null
	}

	self.gun = {
		"name": "",
		"damage": 0.00,
		"damage_range": 0.00,
		"fire_rate": 0.00,
		"shotability": null,
		"bullet_timer": null
	}

	self.enemies_numbers = []
	self.enemies = []

	self.boss_dmg = 20

	self.target = null
	
	self.player_dead = false
	
	not_game_scene()
