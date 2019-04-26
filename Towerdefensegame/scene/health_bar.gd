extends Node2D

var greenbar = preload("res://resource/health bar/greenbar.png")
var yellowbar = preload("res://resource/health bar/yellow.png")
var redbar = preload ("res://resource/health bar/red-bar.png")

func _ready():
	for node in get_children():
		node.hide()

func update_health_bar(value):
	$health_bar.texture_progress = greenbar
	if value <= 60:
		$health_bar.texture_progress = yellowbar
	if value <= 30:
		$health_bar.texture_progress = redbar
	if value < 100:
		$health_bar.show()
	$health_bar.value = value
	pass
