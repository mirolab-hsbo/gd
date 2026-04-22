extends CharacterBody2D


func _input(event):
	if event.is_action_pressed("pause"):
		print("Pausemenü anzeigen")

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = input_direction * 500.0
	move_and_slide()
