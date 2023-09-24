extends Control

@onready var level = get_parent().get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Fish.text = "Fish: " + str(PetData.fish)


func _on_add_pond_pressed():
	level.add_pond()


func _on_save_pressed():
	level.save_level()
