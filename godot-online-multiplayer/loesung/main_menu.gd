extends Control

const PORT: int = 7890
@onready var _ip_address_line_edit = $MainUIContainer/VBoxContainer/PanelContainer/VBoxContainer2/IpAddressLineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	if _ip_address_line_edit.text.is_empty():
		host_game()
	else:
		connect_to_game(_ip_address_line_edit.text)
	get_tree().change_scene_to_file("res://2d_scene.tscn")

func host_game():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return 
	multiplayer.multiplayer_peer = peer 

func connect_to_game(ip_address: String):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_address, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return 
	multiplayer.multiplayer_peer = peer
