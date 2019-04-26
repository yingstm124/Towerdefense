extends "res://scene/tower/tower.gd"

export (float) var turret_speed
export (int) var detect_radius
onready var detect = get_node("DetectRadius")
onready var mobtimer = get_node("mobtimer") 
var target = null
var body_list = []
var body_node

func _ready():
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius
	


func _process(delta):
	if target is KinematicBody2D:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($top.global_rotation)
		$top.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()
		shoot()


func _on_DetectRadius_body_entered(body):
	body_list.append(body)
	mobtimer.start()
	
		
func _on_DetectRadius_body_exited(body):
	
	target = null

func _on_tower_shoot(bullet, _position , _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position,_direction)

func _on_firerate_timeout():
	can_shoot = true
	
func _on_mobtimer_timeout():
	if body_list == []:
		mobtimer.stop()
	
	body_node = body_list.front()
	if body_node is KinematicBody2D : 
		target = body_node
	else:
		target = null
		body_list.erase(body_node)
	
