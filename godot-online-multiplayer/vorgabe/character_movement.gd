extends CharacterBody2D

@export var speed: float = 500

@onready var _coin_label: Label = $Label

var money = 0

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = input_direction * speed
	move_and_slide()

func increment_coins() -> void:
	money += 1
	_coin_label.text = "Münzen: " + str(money)
