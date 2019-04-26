extends Control

onready var grid_size = Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y)
var cellsize = 32
var coord = Vector2(0,0)
var grid = []
var g
var temp



func _ready(): 
	var cell_sizex = int(get_viewport_rect().size.x/cellsize)
	var cell_sizey = int(get_viewport_rect().size.y/cellsize)
	
	g = $GridContainer
	
	# keep area in array
	for x in range (0, 1024, 32):
		for y in range (0, 600, 32):
			grid.append([x,y])
	
	print(grid)
			
	pass

#func _input(event):
	#if event is InputEventMouseMotion:
		#print(get_global_mouse_position())
		

func _draw():
	#var cell_sizex = int(get_viewport_rect().size.x/cellsize)
	#var cell_sizey = int(get_viewport_rect().size.y/cellsize)
	
	#for x in range (0, cell_sizex):
		#for y in range (0, cell_sizey):
			#draw_line(Vector2(x,y), Vector2(x, y * cellsize), Color( 0.98, 0.92, 0.84, 1 ), 1.0)
			#draw_line(Vector2(x,y), Vector2(x * cellsize, y), Color( 0.98, 0.92, 0.84, 1 ), 1.0)
	
	for x in range (0,grid_size.x, 32):
		for y in range (0,grid_size.y, 32):
			draw_line(Vector2(x,y), Vector2(x+32, y), Color( 0.98, 0.92, 0.84, 1 ), 1.0)
			draw_line(Vector2(x,y), Vector2(x,y+32), Color( 0.98, 0.92, 0.84, 1 ), 1.0)
		
	
	
	
		