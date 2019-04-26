extends Sprite

var max_life = 100
var life = max_life
var coin = 0

var monster = []

func _ready():
	pass
	
func set_max_life(val):
	max_life = val
	life = val

