extends ConditionLeaf

func tick(actor, blackboard) -> int:
	if actor.objective == "food":
		return SUCCESS
	else:
		return FAILURE
