extends State
class_name WalkingState

@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Walking state entered...")
	var dir = parent.get_direction()
	get_parent().get_anim("walking_" + dir)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

