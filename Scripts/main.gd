extends Node2D

@onready var ponds = [$WaterLeft, $WaterMiddle, $WaterRight]


# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.load_game()
	$WaterLeft.visible = Level1.water1.visible
	$WaterLeft.get_child(2).start(Level1.water1.timer)
	$WaterMiddle.visible = Level1.water2.visible
	$WaterMiddle.get_child(2).start(Level1.water2.timer)
	$WaterRight.visible = Level1.water3.visible
	$WaterRight.get_child(2).start(Level1.water3.timer)
	if Level1.next_pond >= ponds.size() - 1:
		$Button.disabled = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$fish.text = "fish: " + str(PetData.fish)
	if PetData.fish < Level1.pond_cost or Level1.next_pond == ponds.size():
		$Button.disabled = true
	else:
		$Button.disabled = false

	$PondCost.text = "Pond Cost: " + str(Level1.pond_cost)
	$"Level Cost".text = "Next Level: " + str(Level1.next_level)

func _on_save_pressed():
	Level1.water1.visible = $WaterLeft.visible
	Level1.water1.timer = $WaterLeft.get_child(2).time_left
	Level1.water2.visible = $WaterMiddle.visible
	Level1.water2.timer = $WaterMiddle.get_child(2).time_left
	Level1.water3.visible = $WaterRight.visible
	Level1.water3.timer = $WaterRight.get_child(2).time_left
	Utils.save_game()


func add_pond():
	if ponds[Level1.next_pond].visible and ponds.size() > Level1.next_pond:
		pass
	else:
		ponds[Level1.next_pond].visible = true
		PetData.fish -= Level1.pond_cost
	if Level1.next_pond < ponds.size() - 1:
		Level1.next_pond += 1
	else:
		$Button.disabled = true
