extends CharacterBody2D

const speed = 200
@onready var nav_agent = $NavigationAgent2D
@onready var path_visualizer : Line2D 

var points = [] 
var shift : Vector2

func _ready() -> void:
	path_visualizer = get_node("/root/Node2D/Line2D") 
	shift = position
	print(shift)
	
func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	self.velocity = dir * speed
	move_and_slide()
	update_path(global_position) 

func makepath() -> void:
	nav_agent.target_position = get_viewport().get_mouse_position()

func _on_timer_timeout():
	#print("tic")
	makepath()

	path_visualizer.points = points
#	print(points)

func update_path(new_position: Vector2):
	print(new_position)
	new_position -= shift
	print(new_position)
	points.append(new_position)  # Add the new position to the points array
	path_visualizer.points = points  # Update the Line2D points to draw the path

