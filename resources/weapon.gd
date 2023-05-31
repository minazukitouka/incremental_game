class_name Weapon extends Resource

signal level_changed

@export var name: String
@export var level: int = 0:
	set(value):
		level = value
		level_changed.emit()
@export var upgrade_cost_base: float = 1.0
@export var upgrade_cost_rate: float = 2.0
@export var weapon_scene: PackedScene


func upgrade_cost() -> float:
	return pow(upgrade_cost_base * (level + 1), upgrade_cost_rate)
