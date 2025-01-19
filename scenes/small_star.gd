extends Node3D


var vertical_speed: float = 0.0

func init(x, y, z, size):
	translate(Vector3(x, y, z))
	scale = Vector3(size, size, size)
	vertical_speed = (200.0 + y) / 10.0
