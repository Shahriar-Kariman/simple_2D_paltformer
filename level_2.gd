extends Node2D

var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		$Camera2D.position.x = clamp($player.position.x,320,960)
		$Camera2D.position.y = clamp($player.position.y,0,540)

func _on_border_body_entered(body):
	get_tree().reload_current_scene()

func _on_end_body_entered(body):
	$EndScreen/ConfirmationDialog.visible = true
	active = false
