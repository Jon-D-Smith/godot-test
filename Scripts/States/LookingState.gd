extends State
class_name LookingState

@onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("looking state entered...")
	get_parent().get_anim("looking")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

