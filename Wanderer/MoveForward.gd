extends ActionLeaf

# Move the ant forward

func tick(actor, blackboard) -> int:
	actor.move_forward(blackboard.get("delta"))
	return SUCCESS
