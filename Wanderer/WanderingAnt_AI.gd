extends KinematicBody2D

export(NodePath) onready var ray_collider = get_node(ray_collider)
export(NodePath) onready var ray_collider_l = get_node(ray_collider_l)
export(NodePath) onready var ray_collider_r = get_node(ray_collider_r)
export(NodePath) onready var animSprite = get_node(animSprite)
export(float) var move_speed : float = 200

export(Vector2) var rotate_timer : Vector2 = Vector2(2, 6)
export(Vector2) var min_target : Vector2 = Vector2(-500,-500)
export(Vector2) var max_target : Vector2 = Vector2(500,500)
export(float) var rotate_speed : float = 5
var angle := 0.0
var random_dir := Vector2.ZERO
var velocity = Vector2.ZERO

# Custom Functions
func move_forward(delta) -> void:
	velocity = transform.x * move_speed
	move_and_slide(velocity, Vector2.UP)
	animateWalk()
	print(random_dir)


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
		var f1 := rand_range(min_target.x, max_target.x)
		var f2 := rand_range(min_target.y, max_target.y)
		random_dir = Vector2(f1, f2)
	else:
		angle = transform.x.angle_to(random_dir)
		if abs(angle) > .01:
			rotate(sign(angle) * min((delta * rotate_speed), abs(angle)))

func rotate_till_clear(flag, pos_neg, delta) -> void:
	var rot = pos_neg * .4
	if flag:
		random_dir = random_dir.rotated(pos_neg)
		rotate(rot)


func animateWalk():
	animSprite.animation = "walk"

func animateIdle():
	animSprite.animation = "idle"
