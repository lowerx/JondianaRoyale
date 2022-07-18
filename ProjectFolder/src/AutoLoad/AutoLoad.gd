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

var boss_dmg = 20


func _ready():
	randomize()


func _process(delta):
	pass


func game_scene():
	_game_scene = true


func not_game_scene():
	_game_scene = false


func reset_values():
	get_tree().paused = false
	self.location = {
		"bushes": 0.00,
		"trees": 0.00
	}
	self.enemies_numbers = []
	self.enemies = []
	self.gun = {
		"name": "",
		"damage": 0,
		"damage_range": 0.00,
		"fire_rate": 0.00,
		"shotability": null,
		"bullet_timer": null
	}
	not_game_scene()
