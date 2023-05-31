extends Node2D

@onready var label: Label = $Label


var damage: float:
	set(value):
		label.text = '-' + str(value)
