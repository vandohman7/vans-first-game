extends CharacterBody2D

var SPEED = 400.0
var JUMP_VELOCITY = -400.0
#var howLongKeyPressed = 0
var acceleration = 20

@onready var sprite_2d = $Sprite2D
@onready var attack_hitbox: CollisionShape2D = $HurtboxComponent/attack_hitbox

var inAir = 0

#var entitiesInAttackRange: Array[Node2D] = []

var facing_dir: String = "right"
var fastfall = false

var attackAnimationTime = .4
var isAttacking: float = 0


		



#func _process(delta: float) -> void:
	
	####### ATTACKING ######3




func _physics_process(delta: float) -> void:

	if not is_on_floor():
		acceleration = 5
		velocity += get_gravity() * delta
		#sprite_2d.animation = "jumping"
	else:
		acceleration = 20


	if is_on_floor():
		fastfall = false



	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, acceleration)
		
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)

	move_and_slide()
	


	if Input.is_action_just_pressed("left"):
		facing_dir = "left"
	if Input.is_action_just_pressed("right"):
		facing_dir = "right"
	
	sprite_2d.flip_h = facing_dir == "left"	
		
	#if facing_dir == "left":
		#sprite_2d.flip_h = true
	#else: 
		#sprite_2d.flip_h = false
		
	
	#sprite_2d.flip_h = facing_dir


	if isAttacking == 0 and Input.is_action_just_pressed("attack"):
		sprite_2d.animation = "attack"
		
		
		#sprite_2d.frame = 0
		#sprite_2d.play()		
		isAttacking = .000001;
	elif (isAttacking > 0):
		attack_hitbox.disabled = false
		isAttacking += delta
		
	if (isAttacking > 0):
		#if entitiesInAttackRange.size():
			#pass
			#for row in entitiesInAttackRange:
				#destroy_node(row)
			#destroy_node(entitiesInAttackRange[0])
		# kill things in hitbox
		pass
	if (isAttacking > 0):
		velocity.x = 0


	if isAttacking >= attackAnimationTime:
		isAttacking = 0.0
		
	if isAttacking == 0.0:
		attack_hitbox.disabled = true
		if velocity.x > 1 or velocity.x < -1:
			if sprite_2d.is_playing(): 
				sprite_2d.animation = "running"
				
			else:
				sprite_2d.play("running")
		else: 
			if sprite_2d.is_playing(): 
				sprite_2d.animation = "default"
			else:
				sprite_2d.play("default")
	
	#pass # Replace with function body.

	if Input.is_action_pressed("sprint"):
		SPEED = 550
		acceleration = 40
	else:
		SPEED = 400
		acceleration = 20


		
#func _on_sprite_2d_animation_finished() -> void:
	#sprite_2d.animation = "default"




# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	else: if Input.is_action_just_pressed("jump"):
		velocity.y = +400
		fastfall = true
	


	if Input.is_action_just_pressed("small_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + 100
	else: if Input.is_action_just_pressed("small_jump"):
		velocity.y = +400
		#velocity.x = 0

	if Input.is_action_just_pressed("main_menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


	#if Input.is_action_just_pressed("high_jump") and is_on_floor():
			#velocity.y = JUMP_VELOCITY -50
	#else: if Input.is_action_just_pressed("high_jump"):
		#velocity.y = +400
			###velocity.x = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	print('added ' + body.name)
	pass
	#var alreadyIn = entitiesInAttackRange.has(body)
	#var isSelf = body.name == "CharacterBody2D"
		#
	#if not alreadyIn and not isSelf:
		#entitiesInAttackRange.push_front(body)
	#print(entitiesInAttackRange.size())
	
	
# Assumes this function is called with the Node2D reference you want to destroy.
func destroy_node(target_node: Node2D):
	#if is_instance_valid(target_node):
		#print("Destroying node: ", target_node.name)
		#target_node.queue_free()
	#else:
		## This handles cases where the node might have already been destroyed 
		## by something else just before this function was called.
		#print("Error: Target node is already invalid or destroyed.")
	pass
