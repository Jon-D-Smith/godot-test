extends State
class_name SittingState

@onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("sitting state entered...")
	get_parent().get_anim("sitting")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
