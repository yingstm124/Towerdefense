extends Node2D

var grid_coord = []

func _ready():
	grid_coord = generate_grid()
	path_tree(grid_coord)
	#print(grid_coord)
	pass

func _draw():
	for row in range (0,int(1024),64):
		for col in range (0,int(600),64):
			draw_line(Vector2(row,col), Vector2(row,col+64), Color( 0.75, 0.75, 0.75, 1 ))
			draw_line(Vector2(row,col), Vector2(row+64,col), Color( 0.75, 0.75, 0.75, 1 ))
	pass

func generate_grid():
	for y in range (0, int(600/64)):
		var grid_ = []
		for x in range (0, int(1024/64)):		
			grid_.append(true)
		grid_coord.append(grid_)
	return grid_coord

func path_tree(grid_coord):
	# row = 0
	grid_coord[0][0] = false
	grid_coord[0][1] = false
	grid_coord[0][2] = false
	grid_coord[0][5] = false
	grid_coord[0][6] = false
	grid_coord[0][9] = false
	grid_coord[0][10] = false
	grid_coord[0][11] = false
	grid_coord[0][13] = false
	grid_coord[0][14] = false
	grid_coord[0][15] = false
	# row 1
	grid_coord[1][0] = false
	grid_coord[1][1] = false
	grid_coord[1][2] = false
	grid_coord[1][11] = false
	grid_coord[1][14] = false
	grid_coord[1][15] = false
	# row 2
	grid_coord[2][2] = false
	grid_coord[2][3]= false
	grid_coord[2][4] = false
	grid_coord[2][8] = false
	grid_coord[2][9] = false
	grid_coord[2][10] = false
	grid_coord[2][11] = false
	# row 3
	grid_coord[3][2] = false
	grid_coord[3][4] = false
	grid_coord[3][5] = false
	grid_coord[3][6] = false
	grid_coord[3][7] = false
	grid_coord[3][8] = false
	grid_coord[3][11] = false
	grid_coord[3][15] = false
	# row 4
	grid_coord[4][2] = false
	grid_coord[4][3] = false
	grid_coord[4][4] = false
	grid_coord[4][8] = false
	grid_coord[4][11] = false
	# row 5
	grid_coord[5][0] = false
	grid_coord[5][1] = false
	grid_coord[5][6] = false
	grid_coord[5][8] = false
	grid_coord[5][11] = false
	grid_coord[5][12] = false
	grid_coord[5][13] = false
	grid_coord[5][14] = false
	grid_coord[5][15] = false
	# row 6
	grid_coord[6][0] = false
	grid_coord[6][2] = false
	grid_coord[6][3] = false	
	grid_coord[6][4] = false
	grid_coord[6][5] = false
	grid_coord[6][6] = false
	grid_coord[6][7] = false
	grid_coord[6][8] = false
	grid_coord[6][11] = false
	# row 7
	grid_coord[7][0] = false
	grid_coord[7][1] = false
	grid_coord[7][2] = false
	grid_coord[7][3] = false
	grid_coord[7][8] = false
	grid_coord[7][9] = false
	grid_coord[7][11] = false
	grid_coord[7][10] = false
	grid_coord[7][12] = false
	grid_coord[7][14] = false
	grid_coord[7][13] = false
	grid_coord[7][15] = false
	# row 8
	grid_coord[8][0] = false
	grid_coord[8][1] = false
	grid_coord[8][2] = false
	grid_coord[8][3] = false
	grid_coord[8][4] = false
	grid_coord[8][8] = false
	grid_coord[8][12] = false
	grid_coord[8][13] = false
	grid_coord[8][14] = false
	grid_coord[8][15] = false
	
	pass