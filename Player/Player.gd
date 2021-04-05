extends KinematicBody2D

const MAX_SPEED = 80
const ACCELARATION = 240
const FRICTION = ACCELARATION

var velocity = Vector2.ZERO

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if inputVector != Vector2.ZERO:
		velocity = velocity.move_toward(inputVector * MAX_SPEED, ACCELARATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_slide(velocity)
