extends ConditionLeaf


func tick(actor, blackboard) -> int:
	var mouse_position = get_viewport().get_mouse_position()
	if actor.is_mouse_close(mouse_position):
		blackboard.set("mouse_position", mouse_position)
		return SUCCESS
	return FAILURE
