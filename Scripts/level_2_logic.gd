extends Node2D

@onready var ponds = [$Pond21, $Pond22, $Pond23, $Pond24, $Pond25, $Pond26, $Pond27]


# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.load_game()
	$Pond21.visible = Level2.Pond21.visible
	$Pond21.get_child(2).start(Level2.Pond21.timer)
	$Pond22.visible = Level2.Pond22.visible
	$Pond22.get_child(2).start(Level2.Pond22.timer)
	$Pond23.visible = Level2.Pond23.visible
	$Pond23.get_child(2).start(Level2.Pond23.timer)
	$Pond24.visible = Level2.Pond24.visible
	$Pond24.get_child(2).start(Level2.Pond24.timer)
	$Pond25.visible = Level2.Pond25.visible
	$Pond25.get_child(2).start(Level2.Pond25.timer)
	$Pond26.visible = Level2.Pond26.visible
	$Pond26.get_child(2).start(Level2.Pond26.timer)
	$Pond27.visible = Level2.Pond27.visible
	$Pond27.get_child(2).start(Level2.Pond27.timer)

	if Level2.next_pond >= ponds.size() - 1:
		$Button.disabled = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$fish.text = "fish: " + str(PetData.fish)


func _on_save_pressed():
	Level2.Pond21.visible = $Pond21.visible
	Level2.Pond21.timer = $Pond21.get_child(2).time_left
	Level2.Pond22.visible = $Pond22.visible
	Level2.Pond22.timer = $Pond22.get_child(2).time_left
	Level2.Pond23.visible = $Pond23.visible
	Level2.Pond23.timer = $Pond23.get_child(2).time_left
	Level2.Pond24.visible = $Pond24.visible
	Level2.Pond24.timer = $Pond24.get_child(2).time_left
	Level2.Pond25.visible = $Pond25.visible
	Level2.Pond25.timer = $Pond25.get_child(2).time_left
	Level2.Pond26.visible = $Pond26.visible
	Level2.Pond26.timer = $Pond26.get_child(2).time_left
	Level2.Pond27.visible = $Pond27.visible
	Level2.Pond27.timer = $Pond27.get_child(2).time_left
	Utils.save_game()


func add_pond():
	if ponds[Level2.next_pond].visible and ponds.size() > Level2.next_pond:
		pass
	else:
		ponds[Level2.next_pond].visible = true
	if Level2.next_pond < ponds.size() - 1:
		Level2.next_pond += 1
	else:
		$Button.disabled = true
