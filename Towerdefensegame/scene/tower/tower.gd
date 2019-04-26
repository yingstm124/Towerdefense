extends KinematicBody2D

signal health_changed
signal dead
signal shoot

export (PackedScene) var Bullet
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health
var bullet_pos = Vector2()

var can_shoot = true


func _ready():
	$firerate.wait_time = gun_cooldown
	
func shoot():
	if can_shoot:
		can_shoot = false
		$firerate.start()
		var dir = Vector2(1,0).rotated($top.global_rotation)
		emit_signal('shoot',Bullet,get_node("top/Muzzle").get_position(),dir)
		




