extends CharacterBody2D

var SPEED = 400.0
var JUMP_VELOCITY = -400.0
#var howLongKeyPressed = 0
var acceleration = 20
@onready var sprite_2d = $Sprite2D

var inAir = 0






func jump():
	velocity.y = JUMP_VELOCITY + 200
	
	
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		acceleration = 5
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"
	else:
		acceleration = 20
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, acceleration)
		#howLongKeyPressed = howLongKeyPressed + 1;
		#amount = howLongKeyPressed * acceleration
		#if amount > SPEED_MAX:
			#amount = SPEED_MAX
		#velocity.x = direction * amount
		#print('direction:', direction, ' amount:', amount)
		#velocity.x = direction * SPEED_MAX
	else:
		#howLongKeyPressed = 0
		velocity.x = move_toward(velocity.x, 0, acceleration)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft


	if velocity.x > 1 or velocity.x < -1:sprite_2d.animation = "running"
	 
	else: sprite_2d.animation = "default"
	pass # Replace with function body.
