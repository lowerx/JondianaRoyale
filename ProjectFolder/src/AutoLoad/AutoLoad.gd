extends Node

signal update

export var time = 0.00

var start = true
var _game_scene = false

var bushes = 0.00
var trees = 0.00
var level = 10.0

var abilities = []

var guns = []

var enemies_numbers = []
var enemies = []


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
	self.bushes = 0.00
	self.trees = 0.00
	self.enemies_numbers = []
	self.enemies = []
	self.guns = []
	not_game_scene()
