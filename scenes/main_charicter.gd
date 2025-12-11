extends CharacterBody2D

var SPEED = 400.0
var JUMP_VELOCITY = -400.0
#var howLongKeyPressed = 0
var acceleration = 20
@onready var sprite_2d = $Sprite2D

var inAir = 0




var fastfall = false

#func sprint(): 

		

func jump():
	velocity.y = JUMP_VELOCITY + 200
pass





func _physics_process(delta: float) -> void:

	if not is_on_floor():
		acceleration = 5
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"
	else:
		acceleration = 20

#func _eeeeeee()
	if is_on_floor():
		fastfall = false
		#print("2")


	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, acceleration)
		
	else:
		#howLongKeyPressed = 0
		velocity.x = move_toward(velocity.x, 0, acceleration)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft


	if velocity.x > 1 or velocity.x < -1:sprite_2d.animation = "running"
	 
	else: sprite_2d.animation = "default"
	pass # Replace with function body.

	if Input.is_action_pressed("sprint"):
		SPEED = 550
		acceleration = 40
	
	else:
		SPEED = 400
		acceleration = 20


	#if velocity.x +600 or -600:
		#JUMP_VELOCITY = 500

# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	else: if Input.is_action_just_pressed("jump"):
		velocity.y = +400
		fastfall = true
		#print ("1")
	


	if Input.is_action_just_pressed("small_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + 100
	else: if Input.is_action_just_pressed("small_jump"):
		velocity.y = +400
		#velocity.x = 0


	#if Input.is_action_just_pressed("high_jump") and is_on_floor():
			#velocity.y = JUMP_VELOCITY -50
	#else: if Input.is_action_just_pressed("high_jump"):
		#velocity.y = +400
		##velocity.x = 0
