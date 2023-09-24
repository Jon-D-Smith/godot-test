extends State
class_name RunningState

@onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("running state entered...")
	get_parent().get_anim("running")
	print(get_parent().get_direction())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
