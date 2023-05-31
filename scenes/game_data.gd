extends Node

signal experience_changed(experience)

var experience := 0.0:
	set(value):
		experience = value
		experience_changed.emit(value)

var manual_weapon = preload('res://resources/finger.tres')
var weapons = [
	preload('res://resources/slash.tres'),
	#preload('res://resources/assassinate.tres'),
	#preload('res://resources/blizzard.tres')
]


func upgrade_weapon(weapon: Weapon) -> void:
	if experience >= weapon.upgrade_cost():
		experience -= weapon.upgrade_cost()
		weapon.level += 1
