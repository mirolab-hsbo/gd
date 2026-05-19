extends Node2D

@onready var viewport1 = $ViewportContainer/LeftViewportContainer/LeftViewport
@onready var viewport2 = $ViewportContainer/RightViewportContainer/RightViewport
@onready var camera1 = $ViewportContainer/LeftViewportContainer/LeftViewport/LeftCamera
@onready var camera2 = $ViewportContainer/RightViewportContainer/RightViewport/RightCamera
@onready var world = $ViewportContainer/LeftViewportContainer/LeftViewport/Scene

func _ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = world.get_node("Player1")
	camera2.target = world.get_node("Player2")
