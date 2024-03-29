extends Node2D

var can_click = false
var combination = []

var combination_length = 4

signal combination 
export var lock_group = "Unset"

func _ready():
	generate_combination()
	emit_signal("combination", combination, lock_group)
	$Label.rect_rotation = -rotation_degrees
	$Label.text = lock_group
	
func generate_combination():
	combination = CombinationGenerator.generate_combination(combination_length)
	set_popup_text()
	
func set_popup_text():
	$CanvasLayer/ComputerPopup.set_text(combination)

func _on_Area2D_body_entered(body):
	can_click = true


func _on_Area2D_body_exited(body):
	can_click = false
	$Sprite/Light2D.enabled = false
	$CanvasLayer/ComputerPopup.hide()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/ComputerPopup.popup_centered()
		$Sprite/Light2D.enabled = true
		
