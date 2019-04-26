extends Area2D

export (int) var speed
export (int) var damage
export (float) var liftime

var velocity = Vector2()

func start(_position,_direction):
	position = _position
	rotation = _direction.angle()
	$Liftime.wait_time = liftime
	velocity = _direction * speed

func _process(delta):
	position +=  velocity * delta
	
func explode():
	queue_free()
	


func _on_Liftime_timeout():
	explode()


func _on_Bullet_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)
	
