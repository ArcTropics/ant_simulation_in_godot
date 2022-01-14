extends ActionLeaf

func tick(actor, blackboard) -> int:
	var delta = blackboard.get("delta")
	var pos_neg = blackboard.get("pos_neg")
	
	actor.rotate_till_clear(true, pos_neg, delta)
	return SUCCESS
