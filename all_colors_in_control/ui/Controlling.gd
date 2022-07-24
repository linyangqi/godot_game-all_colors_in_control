extends HSplitContainer

#onready var left_button := $Left
#onready var right_button := $Right


func _on_Left_button_down():
	Input.action_press("turn_left")


func _on_Left_button_up():
	Input.action_release("turn_left")


func _on_Right_button_down():
	Input.action_press("turn_right")


func _on_Right_button_up():
	Input.action_release("turn_right")
