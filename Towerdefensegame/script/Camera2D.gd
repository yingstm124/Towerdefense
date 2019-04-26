extends Camera2D

export var speed = 10.0
export var zoomspeed = 10.0
export var zoommargin = 300

export var zoomMin = 0.25
export var zoomMax = 3.0

var zoompos = Vector2()
var zoomfactor = 1.0
var zooming = false

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	
	# movement
	var inpx = (int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")))
	var inpy = (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
	
	position.x = lerp(position.x, position.x + inpx * speed, speed * delta)
	position.y = lerp(position.y, position.y + inpy * speed, speed *delta)
	
	# zoom
	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomfactor * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomfactor * delta)
	
	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
	zoom.y = clamp(zoom.y, zoomMin, zoomMax)
	
	if not zooming:
		zoomfactor = 1.0
	pass
	
func _input(event):
	
	if abs(zoompos.x - get_global_mouse_position().x) > zoommargin:
		zoomfactor = 1.0
	if abs(zoompos.y - get_global_mouse_position().y) > zoommargin:
		zoomfactor = 1.0
	
	
	if event is InputEventMouseButton:
		
		if event.is_pressed():
			zooming = true
			if event.button_index == BUTTON_WHEEL_UP:
				zoomfactor -= 0.5
				zoompos = get_global_mouse_position()
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoomfactor += 0.5
				zoompos = get_global_mouse_position()
		else:
			zooming = false