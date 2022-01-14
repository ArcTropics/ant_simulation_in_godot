extends ConditionLeaf


func tick(actor, blackboard) -> int:
	return FAILURE
	if actor.objective == "home":
		return SUCCESS
	else:
		return FAILURE
