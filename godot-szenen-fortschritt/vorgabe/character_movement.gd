extends CharacterBody2D

@export var speed: float = 500

@onready var _coin_label: Label = $Label
@onready var _pause_menu: ColorRect = $ColorRect

var money = 0

func _ready():
	_pause_menu.hide()

func _input(event):
	if event.is_action_pressed("pause"):
		set_physics_process(false)
		_pause_menu.show()

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = input_direction * speed
	move_and_slide()

func increment_coins() -> void:
	money += 1
	_coin_label.text = "Münzen: " + str(money)

func _on_button_button_down() -> void:
	_pause_menu.hide()
	set_physics_process(true)
