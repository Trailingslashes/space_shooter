extends Label

@export var show_debug = true

var FPS = 0
var draw_calls = 0
var frame_time = 0
var VRAM = 0
var player

func init(_player): 
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
	var data = "FPS: " + str(FPS) + "\n" + \
	"Draw calls: " + str(draw_calls) + "\n" + \
	"Frame time: " + str(frame_time) + "\n" + \
	"VRAM: " + str(VRAM) + "\n"
	
	if Utils.is_vaild_node(player):
		data += "Position: " + str(player.global_position) + "\n" + \
		"Rotation: " + str(player.rotation)
	text = data
