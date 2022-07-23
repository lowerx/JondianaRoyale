extends Node

signal update

export var time = 0.00

var start = true
var _game_scene = false

var location = {
	"bushes": 0.00,
	"trees": 0.00
}

var level = 12.0

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


func game_scene():
	
	_game_scene = true
	
	self.boss_hp = max(100 * self.level, 1500)
	self.boss_dmg = max(5 + self.level * 2, 50.0)


func not_game_scene():
	
	_game_scene = false


func reset_values():
	
	get_tree().paused = false
	
	self.location = {
		"bushes": 0.00,
		"trees": 0.00
	}

	self.level = 12.0

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
