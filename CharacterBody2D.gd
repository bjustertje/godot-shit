extends CharacterBody2D


# Movement speed
@export var speed = 100 
var player_position
var target_position
# Get a reference to the player. It's likely different in your project
@onready var Hippopotamus = get_parent().get_node("Hippopotamus")
 
func _physics_process(delta):
	
	# Set player_position to the position of the player node
	player_position = Player.position
	# Calculate the target position
	target_position = (player_position - position).normalized()
 
	# Check if the enemy is in a 3px range of the player, if not move to the target position
	if position.distance_to(player_position) > 3:
		move_and_slide(target_position * speed)
		look_at(player_position)
