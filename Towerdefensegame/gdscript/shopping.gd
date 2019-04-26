extends Node2D

var tower = preload("res://scene/tower.tscn")
onready var grid_size = Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y)
var cell_size = 32
var grid_coord = []
var grid_ = []
var pos

func _ready():
	grid_coord = generate_grid()
	#print(grid_coord)
	set_process_input(true)
	pass
	

func _input(event):
	pos = Vector2(int(get_global_mouse_position().x/cell_size), int(get_global_mouse_position().y/cell_size))
	#if event is InputEventMouseButton and event.is_pressed():
		
		#print(pos)
		
		
func generate_grid():
	for x in range (0, grid_size.x, cell_size):
		for y in range (0, grid_size.y, cell_size):
			grid_coord.append([x,y,true])
	return grid_coord
	pass

func _draw():
	for x in range (0, grid_size.x, cell_size):
		for y in range (0, grid_size.y, cell_size):
			draw_line(Vector2(x,y), Vector2(x, y+cell_size), Color( 0.98, 0.92, 0.84, 1 ), 1.0)
			draw_line(Vector2(x,y), Vector2(x+cell_size, y), Color( 0.98, 0.92, 0.84, 1 ), 1.0)