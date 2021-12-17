extends ConditionLeaf


func tick(actor, blackboard):
	var distance = abs((blackboard.get("mouse_position") - actor.position).length())
	if distance < 3:
		return SUCCESS
	return FAILURE
