extends TileMap

var tower = preload("res://scene/scene_tile/towertest_tilemap.tscn")
var tower1 = preload("res://scene/scene_tile/towertest_tilemap.tscn")
var tower2 = preload("res://scene/scene_tile/tower2_tilemap.tscn")
var tower3 = preload("res://scene/scene_tile/tower3_tileMap.tscn")

var grid = preload("res://scene/MainMap/grid.tscn")
var select = preload("res://scene/MainMap/selecttower.tscn")
var select1 = select.instance()
var checking 
var tile = Vector2()

func _ready():
	# instance
	grid = grid.instance()
	tower = tower.instance()
	tower1 = tower1.instance()
	tower2 = tower2.instance()
	tower3 = tower3.instance()
	
	add_child(grid)
	set_process_input(true)
	pass # Replace with function body.

func _input(event):
	# when you click on map
	if  event is InputEventMouseButton and Input.is_action_pressed("clickleft") :
		var mouse =  get_global_mouse_position()
		grid.pos = mouse
		#print(grid.pos)
		tile = self.world_to_map(mouse)
		# checking before place the tower
		checking = false
		checking_tile(tile)
		print(tile)
		print(mouse)
		
		if checking == true:
			# add the tower on grid
			add_child(tower)
			tower.set_cellv(tile,0)
			grid.grid_coord[tile.y][tile.x] = null 
		
		#print(mouse)

func checking_tile(tile):
	var g = grid.grid_coord
	#print(g[tile.y][tile.x])
	#print(tile)
	#print(g)
	if g[tile.y][tile.x] == true:
		checking = true
		g[tile.y][tile.x] = false
		print("you can")
	elif g[tile.y][tile.x] == null:
		print("Tower here!")
	else:
		checking = false
		print("Pace again")
	
	pass

func _on_tower1_pressed():
	tower = tower1
	pass 

func _on_tower2_pressed():
	tower = tower2
	pass 

func _on_tower3_pressed():
	tower = tower3
	pass 
