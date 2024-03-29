extends CharacterBody2D

var active = true

const SPEED = 200
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if active:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AnimatedSprite2D.animation = "Jump"

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction==0:
			velocity.x = direction * SPEED
			$AnimatedSprite2D.animation = "Idle"
		elif  direction:
			velocity.x = direction * SPEED
			$AnimatedSprite2D.animation = "Right"
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$AnimatedSprite2D.animation = "Right"

		move_and_slide()


func _on_end_body_entered(body):
	active = false
