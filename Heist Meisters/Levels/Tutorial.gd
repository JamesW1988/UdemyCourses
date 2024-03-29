extends Node2D

func _ready():
	update_pointer_position(0)

func update_pointer_position(objective_number):
	var pointer = $ObjectiveMarker
	var place = $ObjectivePositions.get_child(objective_number)
	var message = $ObjectiveMessages.get_child(objective_number)
	
	$Tween.interpolate_property(pointer, "position", pointer.position,
		place.position, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$MessageSound.play()
	$TutorialGUI/AnimationPlayer.play("MessageChange")
	$TutorialGUI/Control/NinePatchRect/Label.text = message.message

func _on_MoveObjective_body_entered(body):
	update_pointer_position(1)


func _on_DoorObjective_body_entered(body):
	get_tree().call_group("Interface", "NIGHTVISION_mode")
	update_pointer_position(2)


func _on_NightvisionObjective_body_entered(body):
	update_pointer_position(3)


func _on_BriefcaseObjective_body_entered(body):
	update_pointer_position(4)
