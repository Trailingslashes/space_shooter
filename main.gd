extends Node3D

# import player and debug nodes
@onready var debug: Node = $debug
@onready var player: Node = $player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.set_boundary(
		$"Boundary/LeftWall".position.x,
		$"Boundary/RightWall".position.x,
		$"Boundary/TopWall".position.z,
		$"Boundary/BottomWall".position.z
	)
	GameManager.spawn_stars(self)
	debug.init(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GameManager.process_background(self, delta)
