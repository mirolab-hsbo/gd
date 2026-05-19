extends Node2D

@export var coin_object: PackedScene
@onready var _positions: Node2D = $Positions
@onready var _timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_timer.start(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_entity():
	var random_position: Marker2D = _positions.get_children().pick_random()

	var new_entity: Node2D = coin_object.instantiate()
	new_entity.position = random_position.position
	add_child(new_entity)


func _on_timer_timeout() -> void:
	spawn_entity()
