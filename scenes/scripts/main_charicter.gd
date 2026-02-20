extends CharacterBody2D

var SPEED = 400.0
var JUMP_VELOCITY = -430.0
#var howLongKeyPressed = 0
var acceleration = 20
var zoominair = true
var inAir = 0

#@onready var attack_hitbox: CollisionShape2D = $HurtboxComponent/attack_hitbox
#@onready var health_component: HealthComponent = $HealthComponent
@onready var animation: AnimationPlayer = $visuals/AnimationPlayer
@onready var visuals: Node2D = $visuals
@onready var hp_label: Label = $HP_ui/Panel/hp_label
@onready var max_hp_label: Label = $HP_ui/Panel/max_hp_label




#var entitiesInAttackRange: Array[Node2D] = []

var facing_dir: String = "right"
var fastfall = false

var attackAnimationTime = .4
var isAttacking: float = 0

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		acceleration = 5
		velocity += get_gravity() * delta
		#sprite_2d.animation = "jumping"
	else:
		acceleration = 20

	if is_on_floor():
		fastfall = false
		zoominair = true

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, acceleration)
		
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)

	move_and_slide()

	if Input.is_action_just_pressed("left"):
		facing_dir = "left"
		visuals.scale.x = -1
		#scale.x = sign(-1)
	if Input.is_action_just_pressed("right"):
		facing_dir = "right"
		visuals.scale.x = 1
	
	#visuals.scale.x()
	#print(visuals.scale.x)


	if isAttacking == 0 and Input.is_action_just_pressed("attack"):
		animation.play("attack")
		isAttacking = .000001;
		
	elif (isAttacking > 0):
		isAttacking += delta
		
	if (isAttacking > 0):
		pass
	if (isAttacking > 0):
		pass

	if isAttacking >= attackAnimationTime:
		isAttacking = 0.0
		
	if isAttacking == 0.0:
		if velocity.x > 1 or velocity.x < -1:
			animation.play("run")
		else: 
			animation.play("idle")

# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	else: if Input.is_action_just_pressed("jump"):
		velocity.y = +800
		fastfall = true
		
	if Input.is_action_just_pressed("zoom") and zoominair == true:
		velocity.y = -150
		zoominair = false
		if facing_dir == ("right"):
			velocity.x = 800
		else: velocity.x = -800

	if Input.is_action_just_pressed("turn_right"):
		facing_dir = "right"
		visuals.scale.x = 1
	
	if Input.is_action_just_pressed("turn_left"):
		facing_dir = "left"
		visuals.scale.x = -1

	if Input.is_action_just_pressed("small_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + 130
	elif Input.is_action_just_pressed("small_jump"):
		velocity.y = +400
		#velocity.x = 0

	if Input.is_action_just_pressed("main_menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_health_component_health_is_zero() -> void:
	#get_tree().call_deferred("free")
	get_tree().call_deferred("reload_current_scene")
	#get_tree().reload_current_scene()

func _on_health_component_health_modified(health: float, _max_health: float) -> void:
	hp_label.text = str(int(health))
