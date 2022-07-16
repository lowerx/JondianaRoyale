extends Node

signal update

export var time = 0.00

var start = true
var _game_scene = false
var bushes = 0.00
var tree = 0.00
var level = 1.0
var enemies_numbers = []


func _ready():
	randomize()


func _process(delta):
	pass


func game_scene():
	_game_scene = true


func not_game_scene():
	_game_scene = false


func reset_values():
	not_game_scene()
