extends KinematicBody2D

signal health_changed 
export (int) var speed
var nav = null setget set_nav
var path = []
var goal = Vector2()
export (int) var max_health
var health
var health_increase = 1

func _ready():
	health = max_health*health_increase
	emit_signal("health_changed",health * 100/max_health)
	set_physics_process(true)
	
func set_nav(new_nav):
	nav = new_nav
	update_path()
	
func update_path():
	path = nav.get_simple_path(get_position(),goal,true)
	if path.size() == 0:
		queue_free()
	
func _physics_process(delta):
	if path.size() > 0:
		var d = get_position().distance_to(path[0])
		if d > 2:
			set_position(get_position().linear_interpolate(path[0],(speed * delta)/d))
		else:
			path.remove(0)
	else:
		queue_free()
		
func take_damage(amout):
	health -= amout
	emit_signal('health_changed',health*100/max_health)
	if health <= 0:
		explode()
		
func explode():
	global.coin += 2
	queue_free()
	
