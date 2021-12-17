extends KinematicBody2D

export(NodePath) onready var animSprite = get_node(animSprite)
export(float) var move_speed : float = 3
export(float) var distance_threshold = 300

# This is a non playr Simulation Object. Most of the processing 
# is happening in the Behavior Tree

# Custom Functions

func is_mouse_close(target_position):
	var distance = (target_position - position).length()
	if abs(distance) > distance_threshold:
		animSprite.animation = "idle"
		return false
	return true

func move_towards_position(target, delta) -> void:
	# Set animation to animate
	animSprite.animation = "walk"
	
	# This function will move the ant towards the given position
	var dir = target - position
	var dir_n = dir.normalized()

	var distance = dir.length() - (dir_n * move_speed).length()
	print(distance)
	if distance > move_speed:
		position += dir_n * move_speed
	else:
		position = target
		animSprite.animation = "idle"


