extends Node
export(int) var max_ants : int = 3

var ant = preload("res://FoodGatherer/FoodGatheringAnt.tscn")

func _ready() -> void:
	for i in range(max_ants):
		rebirth()

func rebirth():
	var new_ant = ant.instance()
	new_ant.position = Vector2(rand_range(10, 1900), rand_range(10, 1000))
#	new_ant.position = get_parent().get_node("Home").position
	new_ant.rotation = randf()
#	get_parent().add_child(new_ant)
	get_parent().call_deferred("add_child", new_ant)
