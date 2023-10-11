extends CharacterBody2D

const speed = 200
@onready var nav_agent = $NavigationAgent2D

func _ready() -> void:
	pass
	#makepath()
	
func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	self.velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = get_viewport().get_mouse_position()

func _on_timer_timeout():
	#print("tic")
	makepath()
