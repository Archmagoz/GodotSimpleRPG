class_name SpeedComponent extends Node2D

@export var min_speed: float
@export var max_speed: float

var cur_speed: float

func _ready() -> void:
	cur_speed = min_speed

func get_speed() -> float:
	return cur_speed
