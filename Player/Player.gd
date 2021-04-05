extends KinematicBody2D

const MAX_SPEED = 100

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	inputVector = inputVector.normalized()
	
	move_and_slide(inputVector * MAX_SPEED)
