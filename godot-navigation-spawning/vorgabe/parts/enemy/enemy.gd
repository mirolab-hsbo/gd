class_name Enemy extends CharacterBody2D




@export var max_speed: float = 400.0
@export var acceleration: float = 1500.0
@export var deceleration: float = 1500.0


var target: Node2D


func _ready():
	var player_nodes: Array = get_tree().get_nodes_in_group("player")
	if not player_nodes.is_empty():
		target = player_nodes[0]


func _physics_process(delta):
	pass

func _on_player_detection_area_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	body.get_hit()
	get_hit()


func get_hit():
	queue_free()
