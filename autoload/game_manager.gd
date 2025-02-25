extends Node

@onready var asteroid_scene = preload("res://scenes/asteroid.tscn")
@onready var small_star_scene = preload("res://scenes/small_star.tscn")

var boundary: Dictionary = {
	"left" : 0.0,
	"right": 0.0,
	"top": 0.0,
	"bottom": 0.0,
}

var boundary_margin: float = 10.0

func set_boundary(left: float, right: float, top: float, bottom: float) -> void:
	boundary.left = left
	boundary.right = right
	boundary.bottom = bottom
	boundary.top = top

func is_in_boundary(node, add_margin = true):
	var margin = boundary_margin if add_margin else 0.0
	return (node.global_position.x > boundary.left - margin
	and node.global_position.x < boundary.right + margin
	and node.global_position.z > boundary.top - margin 
	and node.global_position.z < boundary.bottom + margin)

func spawn_stars(root_node: Node) -> void:
		for i in 40:
			spawn_star(root_node, false)

func spawn_star(root_node, on_top):
	var star = small_star_scene.instantiate()
	star.init(
		randf_range(boundary.left, boundary.right),
		randf_range(-20.0, -50.0),
		boundary.top - boundary_margin if on_top else randf_range(boundary.top, boundary.bottom),
		randf_range(0.02, 0.2),
	)
	root_node.add_child(star)


func process_background(root_node, delta: float):
	for small_star in get_tree().get_nodes_in_group("SmallStar"):
		small_star.global_position.z += small_star.vertical_speed * delta
		var z: float = small_star.position.z
		if z > boundary.bottom + boundary_margin:
			small_star.queue_free()
			spawn_star(root_node, true)

func spawn_ateroids(root_node):
	for i in 5:
		var spawn: Dictionary = {
			"coordinates": Vector3(-40 + i * 20, 0, -30),
			"scale": Utils.get_random_vector3_in_range(1, 4), # size of asteroid
			"direction": Vector3(0,0, randf_range(5, 15)), # all asteroid go from top to bottom
			"rotation": Utils.get_random_vector3_in_range(0.1, 1.0),
		}
		var asteroid = asteroid_scene.instantiate()
		asteroid.init(root_node, spawn)
		root_node.add_child(asteroid)
