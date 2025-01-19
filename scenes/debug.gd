extends Label

@export var show_debug: bool = true

var FPS: int = 0
var draw_calls: int = 0
var frame_time: int = 0
var VRAM: int = 0
var player: CharacterBody3D
var small_star_count: int = 0

func init(_player: Node) -> void:
	player = _player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if show_debug == false:
		text = ""
		return
	FPS = Engine.get_frames_per_second()
	draw_calls = RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_TOTAL_DRAW_CALLS_IN_FRAME)
	frame_time = delta
	VRAM = RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_VIDEO_MEM_USED) / 1024 / 1024
	small_star_count = get_tree().get_nodes_in_group("SmallStar").size()
	var data: String = "FPS: " + str(FPS) + "\n" + \
	"Draw calls: " + str(draw_calls) + "\n" + \
	"Frame time: " + str(frame_time) + "\n" + \
	"VRAM: " + str(VRAM) + "\n" + \
	"Star Count: " + str(small_star_count) + "\n"
	
	if Utils.is_vaild_node(player):
		data += "Position: " + str(player.global_position) + "\n" + \
		"Rotation: " + str(player.rotation)
	text = data
