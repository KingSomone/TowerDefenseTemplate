extends CharacterBody2D


var target
var Speed = 1000
var pathName = ""
@export var bulletDamage = 1

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("MainGame/Pathspawner")
	
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
	if(target != null):
		velocity = global_position.direction_to(target) * Speed
		look_at(target)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if "SoldierA" in body.name:
		body.Health -= bulletDamage
		queue_free()
