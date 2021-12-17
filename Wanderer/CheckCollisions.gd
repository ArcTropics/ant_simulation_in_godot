extends ActionLeaf


func tick(actor, blackboard) -> int:
	var delta = blackboard.get("delta")
	var result = actor.check_for_collisions()
	if result == -1 or result == 1:
		actor.rotate_till_clear(true, result, delta)
		return SUCCESS
	
	if result == 0:
		actor.rotate_till_clear(true, 1, delta)
		return SUCCESS
	
	if result == 2:
		actor.rotate_till_clear(false, 1, delta)
		return FAILURE
	
	print("reaching till end")
	return FAILURE
