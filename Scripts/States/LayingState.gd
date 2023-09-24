extends State
class_name LayingState

@onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("laying state entered...")
	parent.get_anim("laying")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		parent.change_state("walking")

func exit_state():
	parent.get_anim("standing")
	await get_node("../../AnimationPlayer").animation_finished
	
