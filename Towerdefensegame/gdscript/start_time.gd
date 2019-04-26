extends Label

var delay = 10

func _ready():
	set_process(true) 
	pass

func _process(delta):
	if delay >= 0:
		set_text(str(delay))
	pass
	
func _on_Timer_timeout():
	delay -= 1
	pass # Replace with function body.
