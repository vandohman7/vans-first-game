extends Node

@onready var game_manager = %game_manager
@export var health_component: HealthComponent

var is_collected = false

func _on_body_entered(body: Node2D) -> void:
	if is_collected: return # Stop if we already started deleting

	var player_health = body.get_node_or_null("HealthComponent")
	if player_health:
		is_collected = true
		player_health.heal_damage(25)
		queue_free()
