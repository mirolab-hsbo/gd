extends CharacterBody2D

@export var speed: float = 500

@onready var _coin_label: Label = $Label

@export var player_id: int = 1

#@export var world: World2D

var money = 0

func _physics_process(delta: float) -> void:
	var prefix := "p" + str(player_id) + "_"

	var input_direction := Input.get_vector(
		prefix + "move_left",
		prefix + "move_right",
		prefix + "move_up",
		prefix + "move_down"
	)
	velocity = input_direction * speed
	move_and_slide()

func increment_coins() -> void:
	money += 1
	_coin_label.text = "Münzen: " + str(money)
