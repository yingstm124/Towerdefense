extends RichTextLabel

var story = ["ณ อาณาจักรที่แสนรุ่งโรจน์ของเจ้าชายแก้วคำ","ได้มีกลุ่มปีศาจบุกเข้ามาในอาณาจักรเพื่อปล้นลูกอมทุเรียนซึ่งเป็นของขึ้นชื่อของอาณาจักรนี้","เหล่าทหารของเจ้าชายแก้วคำได้รับคำสั่งให้สร้างป้อมปราการเพื่อจัดการกับเหล่าปีศาจที่บุกเข้ามา","หากเหล่าปีศาจสามารถบุกเข้าไปได้สำเร็จลูกอมทุเรียนจะถูกขโมยไปทั้งหมด!!!!",""]
var page = 0
var count = 0

# Called when the node enters the scene tree for the first time.

func _ready():
	set_bbcode(story[page])
	set_visible_characters(0)
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	if page == len(story)-1:
		get_tree().change_scene("res://scene/MainMap/main.tscn")
	
	if Input.is_action_pressed("enter"):
		if get_visible_characters() > get_total_character_count():
			if page < len(story)-1:
				page += 1
				set_bbcode(story[page])
				set_visible_characters(0)
		
	pass

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	pass 
