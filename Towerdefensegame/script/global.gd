extends Node2D

var random_spawn = 0

func _ready():
	set_process(true)
	
func _process(delta):
	random_spawn = randi() % 300
	pass

