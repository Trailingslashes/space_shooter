extends Node3D

# import player and debug nodes
@onready var debug = $debug
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	debug.init(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
