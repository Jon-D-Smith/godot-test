extends Node2D

@onready var timer = $Timer
@onready var pb = $ProgressBar

@export var fish_value : int
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")
	pb.max_value = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pb.value = timer.time_left
	if self.visible == false:
		$Timer.paused = true
	else:
		$Timer.paused = false


func _on_timer_timeout():
	PetData.fish += fish_value
	timer.start(pb.max_value)
