extends ActionLeaf

func tick(actor, blackboard) -> int:
	actor.look_at(blackboard.get("mouse_position"))
	return SUCCESS
