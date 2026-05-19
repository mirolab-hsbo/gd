extends Node2D

@export var player_scene: PackedScene
@onready var _player_multiplayer_spawner: MultiplayerSpawner = $MultiplayerSpawner
@onready var _player_start_positions: Node2D = $PlayerSpawnPositions
var _player_spawn_index: int = 0

func add_player(id: int):
	_player_multiplayer_spawner.spawn(id)
	
func spawn_player(id: int):
	var player: Node2D = player_scene.instantiate()
	var spawn_marker: Marker2D = _player_start_positions.get_child(_player_spawn_index)
	player.position = spawn_marker.position 
	player.multiplayer_id = id
	_player_spawn_index += 1
	return player	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_player_multiplayer_spawner.spawn_function = spawn_player 
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(add_player)
		add_player(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
