extends ActionLeaf


func tick(actor, blackboard) -> int:
	return FAILURE
	actor.rotate_to_home(blackboard.get("delta"))
	return SUCCESS
