extends ActionLeaf
var rng = RandomNumberGenerator.new()

func tick(actor, blackboard) -> int:
	var delta = blackboard.get("delta")
		
	rng.randomize()
	var random_time = blackboard.get("random_rotation_time")
	var tick_count = blackboard.get("tick_count")
	
	if tick_count == null:
		tick_count = 0
	
	if random_time == null:
		random_time = rng.randf_range(actor.rotate_timer.x, actor.rotate_timer.y)
		
	tick_count += 1
	var frame_count : float = random_time * 60
	

	if tick_count >= frame_count:
		tick_count = 0
		actor.rotate_to_random(true, delta)
		blackboard.set("tick_count", tick_count)
		blackboard.set("random_rotation_time", null)
		return SUCCESS


	actor.rotate_to_random(false, delta)
	blackboard.set("tick_count", tick_count)
	blackboard.set("random_rotation_time", random_time)
	return SUCCESS
