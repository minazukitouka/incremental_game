extends Area2D

signal hit(global_position: Vector2)


func _ready() -> void:
	input_event.connect(handle_mouse_event)


func handle_mouse_event(viewport, event, shape_idx) -> void:
	if !(event is InputEventMouseButton):
		return
	if !event.is_pressed():
		return
	if event.button_mask != MOUSE_BUTTON_MASK_LEFT:
		return
	hit.emit(get_global_mouse_position())
