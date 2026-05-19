extends CharacterBody2D

@export var speed: float = 500

@onready var _coin_label: Label = $Label
var multiplayer_id: int 
var money = 0

@onready var _camera_position: Node2D = $Camera2D

func _ready():
	if not is_multiplayer_authority():
		_camera_position.queue_free()
		set_physics_process(false)

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = input_direction * speed
	move_and_slide()

func increment_coins() -> void:
	money += 1
	_coin_label.text = "Münzen: " + str(money)

func _enter_tree():
	set_multiplayer_authority(multiplayer_id)
	#$CoinMultiplayerSynchronizer.set_multiplayer_authority(1)
