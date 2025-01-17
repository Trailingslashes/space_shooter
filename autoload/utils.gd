extends Node

"""
When the player gets destroyed or disappears from the game screen, it can lead to errors 
in the debug script when attempting to retrieve the ship's location and rotation. 
To avoid these crashes, it is important to test the validity  of the specific node. 
Since this check will likely be required in various sections of the game code, it is beneficial 
to create a new autoload singleton class for this purpose.
"""
func is_vaild_node(node) -> bool:
	return is_instance_valid(node) and node != null
