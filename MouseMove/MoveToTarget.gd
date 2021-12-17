extends ActionLeaf


func tick(actor, blackboard) -> int:
	actor.move_towards_position(blackboard.get("mouse_position"), blackboard.get("delta"))
	return RUNNING
