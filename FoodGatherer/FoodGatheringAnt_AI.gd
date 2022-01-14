extends KinematicBody2D

export(NodePath) onready var ray_collider = get_node(ray_collider)
export(NodePath) onready var ray_collider_l = get_node(ray_collider_l)
export(NodePath) onready var ray_collider_r = get_node(ray_collider_r)
export(NodePath) onready var animSprite = get_node(animSprite)

#onready var home = get_parent().get_node("Home")

export(float) var move_speed : float = 200
export(Vector2) var rotate_timer : Vector2 = Vector2(0.1, 0.4)
export(Vector2) var min_target : Vector2 = Vector2(-500,-500)
export(Vector2) var max_target : Vector2 = Vector2(500,500)
export(float) var rotate_speed : float = 5
var angle := 0.0
var random_dir := Vector2.ZERO
var velocity = Vector2.ZERO

var objective : String = "none"
var is_near_food = false
var current_food = null

# Custom Functions
func move_forward(delta) -> void:
	velocity = transform.x * move_speed
	move_and_slide(velocity, Vector2.UP)
#	for i in get_slide_count():
#		var collision = get_slide_collision(i)
#		collision_detected(collision)
	animateWalk()


func check_for_collisions() -> int:
	var hit_f := false
	var hit_l := false
	var hit_r := false
	
	if ray_collider.is_colliding():
		var obstacle = ray_collider.get_collider()
		if obstacle.is_in_group("obstacles") or obstacle.is_in_group("ant"):
			hit_f = true
	
	if ray_collider_l.is_colliding():
		var obstacle = ray_collider_l.get_collider()
		if obstacle.is_in_group("obstacles") or obstacle.is_in_group("ant"):
			hit_l = true

	if ray_collider_r.is_colliding():
		var obstacle = ray_collider_r.get_collider()
		if obstacle.is_in_group("obstacles") or obstacle.is_in_group("ant"):
			hit_r = true
	
	if hit_f and hit_r:
		return -1
	elif hit_f and hit_l:
		return 1
	elif hit_f:
		return 0
	elif hit_l:
		return 1
	elif hit_r:
		return -1
	else:
		return 2


func rotate_to_random(flag, delta) -> void:
	if flag:
		var f1 := rand_range(-0.5, 0.5)
		random_dir = Vector2(f1, f1)

	else:
		angle = transform.x.angle_to(transform.x + random_dir)
		if abs(angle) > 0.01:
			rotate(sign(angle) * min((delta * rotate_speed), abs(angle)))
		


func rotate_till_clear(flag, pos_neg, delta) -> void:
	var rot = pos_neg * .4
	if flag:
		random_dir = random_dir.rotated(pos_neg)
		rotate(rot)
	
func rotate_to_food(delta):
	var dir = current_food.position - position 
	var angle = transform.x.angle_to(dir)
	rotate(angle)
	objective = "food"
	
func setObjective(delta, value) -> void:
	objective = value 


func animateWalk():
	animSprite.animation = "walk"

func animateIdle():
	animSprite.animation = "idle"


#func collision_detected(collision):
#	pass
	

func _on_Food_Detector_area_entered(area: Area2D) -> void:
	if (area.is_in_group("food")):
		is_near_food = true
		current_food = area
		objective = "food"
		

#func _on_Food_Detector_area_exited(area: Area2D) -> void:
#	if (area.is_in_group("food")):
#		is_near_food = false
#		current_food = null
#		objective = "home"
#
#	elif (area.is_in_group("home")):
#		objective = "none"
