extends Area2D

export(float) var size : float = 1


func _on_Food_body_entered(body: Node) -> void:
	if body.is_in_group("ant"):
		size -= 0.02
		body.objective = "none"
	if size < 0:
		queue_free()
		
	scale = Vector2(size, size)


func _on_Food_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
