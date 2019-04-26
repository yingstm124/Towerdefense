extends Label

func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	set_text(str(global.coin))
	pass