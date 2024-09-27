extends Panel


@onready var tower = preload("res://Towers/red_bullet_tower.tscn")
var currTile

func _on_gui_input(event:InputEvent):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left Click Down
		add_child(tempTower)

		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left Click Drag
		get_child(1).global_position = event.global_position

	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click Up
		print("keep yourself safe")
		get_child(1).queue_free()

		var path = get_tree().get_root().get_node("MainGame/Towers")

		path.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.get_node("Area").hide()
