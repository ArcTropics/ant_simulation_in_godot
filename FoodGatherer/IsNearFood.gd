extends ConditionLeaf

func tick(actor, blackboard) -> int:
	if actor.objective == "food":
		return SUCCESS
	else:
		return FAILURE
		
		
#	if actor.is_near_food :
#		return SUCCESS
#	else:
#		return FAILURE
	
