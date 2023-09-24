extends Node


const SAVE_PATH = "res://savegame.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"fish" : PetData.fish,
		"level1_water1" : Level1.water1,
		"level1_water2" :Level1.water2,
		"level1_water3" : Level1.water3,
		"level1_next_pond": Level1.next_pond,
		"Pond21": Level2.Pond21,
		"Pond22": Level2.Pond22,
		"Pond23": Level2.Pond23,
		"Pond24": Level2.Pond24,
		"Pond25": Level2.Pond25,
		"Pond26": Level2.Pond26,
		"Pond27": Level2.Pond27,
		"level2_next_pond": Level2.next_pond
		
	}
	
	
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				PetData.fish = current_line.fish
				Level1.water1 = current_line.level1_water1
				Level1.water2 = current_line.level1_water2
				Level1.water3 = current_line.level1_water3
				Level1.next_pond = current_line.level1_next_pond
				Level2.Pond21 = current_line.Pond21
				Level2.Pond22 = current_line.Pond22
				Level2.Pond23 = current_line.Pond23
				Level2.Pond24 = current_line.Pond24
				Level2.Pond25 = current_line.Pond25
				Level2.Pond26 = current_line.Pond26
				Level2.Pond27 = current_line.Pond27
				Level2.next_pond = current_line.level2_next_pond
				print(current_line)
