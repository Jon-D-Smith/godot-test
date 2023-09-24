extends CharacterBody2D

@export var paw : PackedScene
var move_icon
# MOVEMENT AND NAVIGATION
var movement_speed: float = 25.0
var target: Vector2 = Vector2(75.0,150.0)
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# STATES
@onready var state = State.new()
var states = ["looking", "laying", "walking", "sitting"]
var player_active : bool = false
var current_state = "laying"

# setup locations in each map so we have walking targets

@onready var locations = $"../Locations".get_children()
var can_click = false

var last_location = Vector2.ZERO

func _ready():
	state.name = "State"
	add_child(state)
	state.change_state("laying")
	state.set_available_states()
	
	navigation_agent.path_desired_distance = 5.0
	navigation_agent.target_desired_distance = 5.0
	
func _input(event):
	if event.is_action_pressed("move"):
		$Active.start()
		player_active = true
		target = get_global_mouse_position()
		move_icon = paw.instantiate()
		move_icon.position = target
		get_parent().add_child(move_icon)
		if target.y < position.y:
			state.set_direction("up")
		if target.y > position.y:
			state.set_direction("down")
		state.change_state("walking")
		makepath()
		
	if event.is_action_pressed('1'):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if event.is_action_pressed('2'): 
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	
	
func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	var dir = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = dir * movement_speed
	move_and_slide()
	
	if player_active:
		$Timer.paused = true

func makepath():
	navigation_agent.target_position = target

func _on_timer_timeout():
	state.set_available_states()
	new_state()
	
func _on_navigation_agent_2d_target_reached():
	if player_active:
		state.change_state("sitting")
		return
	var coin_flip = ["walking","walking", "sitting"]
	states = coin_flip
	new_state()

func _on_active_timeout():
	player_active = false
	$Timer.paused = false
	
func walking():
	await state.get_child(0).exit_state()
	current_state = "walking"
	var random_location = locations.pick_random().global_position
	while random_location == last_location:
		random_location = locations.pick_random().global_position
	last_location = random_location
	target = random_location
	if target.y < position.y:
		state.set_direction("up")
	if target.y > position.y:
		state.set_direction("down")
	state.change_state("walking")
	makepath()
	new_timer(10)

func sitting():
	await state.get_child(0).exit_state()
	current_state = "sitting"
	state.change_state("sitting")
	new_timer(10)
	

func laying():
	await state.get_child(0).exit_state()
	current_state = "laying"
	state.change_state("laying")
	new_timer(10)

func looking():
	await state.get_child(0).exit_state()
	current_state = "looking"
	state.change_state("looking")
	new_timer(3)
	meow()
		
func meow():
	$meow.play()
		
func new_state():
	var random_state= states.pick_random()
	print(states)
	match random_state:
		"walking": walking()
		"sitting": sitting()
		"laying" : laying()
		"looking" : looking()
		_:
			pass

func new_timer(time):
	$Timer.stop()
	$Timer.wait_time = time
	$Timer.start()
	print(str($Timer.time_left))
