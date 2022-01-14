extends ActionLeaf

func tick(actor, blackboard) -> int:
	if actor.current_food != null:
		actor.rotate_to_food(blackboard.get("delta"))
		return SUCCESS
	else:
		return FAILURE
