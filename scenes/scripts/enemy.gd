extends RigidBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var game_manager = %game_manager

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	pass


func refresh():
	pass

func _on_health_component_health_is_zero() -> void:
	print("ENEMY DIED")
	queue_free()
