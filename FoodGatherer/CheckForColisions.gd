extends ConditionLeaf


func tick(actor, blackboard) -> int:
	var delta = blackboard.get("delta")
	var result = actor.check_for_collisions()
	var pos_neg = 1
	
	if result == -1 or result == 1:
#		actor.rotate_till_clear(true, result, delta)
		blackboard.set("pos_neg", result)
		return SUCCESS
	
	if result == 0:
#		actor.rotate_till_clear(true, 1, delta)
		blackboard.set("pos_neg", 1)
		return SUCCESS
	
	if result == 2:
		return FAILURE
	
	return FAILURE
