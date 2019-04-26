extends Node2D

#var tower = preload("res://scene/MainMap/towertest_tilemap.tscn")
var dragon = preload("res://scene/dragon.tscn")
var grid = preload("res://scene/showgrid.tscn")
var tower = preload("res://scene/tower/towertest1.tscn")
var tower_ = preload("res://scene/tower/towertest1.tscn")
var lost = preload("res://scene/FirstGUI/DEFEAT.tscn")
var win = preload("res://scene/FirstGUI/Victory.tscn")

onready var contianer = get_node("mob_container")
var tile = Vector2()
onready var map = get_node("TileMap")
onready var start = get_node("start").get_position()
onready var stop = get_node("end").get_position()
onready var stop_down = get_node("enddown").get_position()
onready var nav = get_node("nav2d")
onready var nav_down = get_node("nav_down_main")
onready var wave_count = get_node("wave")
onready var mob_in_wave = get_node("mob_in_wave")
onready var tower_con = get_node("tower_contianer")
onready var delay_defeat = get_node("Defeat_time")

var wave_finish = true
var tower_placed = false
var wave = 1
var health = 100
var checking
var node_on_mouse = true
var place_pos = Vector2()
var can_place = true
var tower_price

func _ready():
	grid = grid.instance()
	lost = lost.instance()
	tower_ = tower_.instance()
	win = win.instance()
	add_child(grid)
	
	# hide grid 
	grid.hide()
	
	# getting start
	set_process(false)
	set_process_input(false)
	pass

func _input(event):
	if Input.is_action_pressed("clickleft"):
		var mouse = get_global_mouse_position()
		tile = get_node("TileMap").world_to_map(mouse)
		
		# position grid
		var pos_x = int((tile.x+1) * 64 - 32)
		var pos_y = int((tile.y+1) * 64 - 32)
		var pos_v = Vector2(pos_x, pos_y)
		var t = tower.instance()
		
		# checking
		checking(tile.x, tile.y)
		# add tower
		if checking == true:
			# check coin
			check_coin()
			if can_place == true:
				# place tower
				grid.grid_coord[tile.y][tile.x] = false
				tower_con.add_child(t)
				t.set_position(pos_v)
				
		node_on_mouse = false
		place_pos = pos_v
	
	pass

# shoping!!
func check_coin():
	if global.coin < tower_price:
		print("Not enough money")
		can_place = false
	else:
		# update money
		global.coin -= tower_price
		can_place = true
	pass
	

func checking(col, row):
	if grid.grid_coord[row][col] == true :
		checking = true
	else:
		print("Place again")
		checking = false
	pass

func _process(delta):
	# tower on mose
	if node_on_mouse == true:
		add_child(tower_)
		tower_.set_position(get_global_mouse_position())
	# out 
	else:
		grid.hide()
		tower_.set_position(Vector2(2000,2000))
		set_process(false)
		
	# Place
	if Input.is_action_pressed("clickleft"):
		set_process_input(true)
	else:
		set_process_input(false)
	pass

#start
func _on_Button_pressed():
	print(wave)
	if wave_finish == true:
		wave_finish = false
		wave += 1
		wave_count.start()
		mob_in_wave.set_wait_time(6*(wave/2))
		mob_in_wave.start()
	if wave > 10:
		wave = 0
		add_child(win)
		delay_defeat.start()


func _on_tower1_pressed():
	tower_price = global.price_tower1
	grid.show()
	node_on_mouse = true
	set_process(true)
	pass
	
func _on_wave_timeout():
	var rand = randi()%11+1
	var d = dragon.instance()
	contianer.add_child(d)
	d.set_position(start)
	if wave > 3:
		d.health_increase = wave - 1 
	if wave >= 3 and rand%2 == 0:
		d.goal = stop_down
		d.nav = nav_down
	else:
		d.goal = stop
		d.nav = nav


func _on_mob_in_wave_timeout():
	wave_finish = true
	wave_count.stop()


func _on_restart_pressed():
	global.coin = 15
	global.life = 10
	get_tree().change_scene("res://scene/MainMap/main.tscn")



func _on_Area2D_body_entered(body):
	global.life -= 1
	if global.life < 0:
		global.life = 0
		add_child(lost)
		delay_defeat.start()
	elif wave == 10:
		wave = 0
		add_child(win)
		delay_defeat.start()
	pass


func _on_Area2D2_body_entered(body):
	global.life -= 1
	if global.life < 0:
		global.life = 0
		add_child(lost)
		delay_defeat.start()
		get_node("background").stop()
	elif wave == 10:
		wave = 0
		add_child(win)
		delay_defeat.start()
		
	pass # Replace with function body.


func _on_Defeat_time_timeout():
	delay_defeat.stop()
	get_node("background").stop()
	global.life = 10
	global.coin = 10
	get_tree().change_scene("res://scene/MainMap/main.tscn")
