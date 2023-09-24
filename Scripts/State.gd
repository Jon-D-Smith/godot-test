extends Node
class_name State

@onready var states : Dictionary = {
		"sitting" : SittingState,
		"looking" : LookingState,
		"laying" : LayingState,
		"walking" : WalkingState,
		"running" : RunningState
	}
var current_state
var direction = "down"
@onready var pet = get_parent()
@onready var anim = get_node("../AnimationPlayer")


func _init():
	pass
	
	
func change_state(new_state_name):
	if get_child_count() != 0:
		get_child(0).queue_free()
	current_state = states.get(new_state_name).new()
	current_state.name = new_state_name
	add_child(current_state)

func exit_state():
	pass


	
func get_anim(animation_name):
	anim.play(animation_name)

func set_available_states():
	match current_state.name:
		"sitting" : pet.states = ["laying", "walking", "looking"]
		"looking" : pet.states = ["sitting", "laying", "walking"]
		"walking": pet.states = ["sitting", "laying", "walking", "looking"]
		"laying": pet.states = ["sitting", "walking", "looking"]


func set_direction(dir):
	direction = dir

func get_direction():
	return direction
