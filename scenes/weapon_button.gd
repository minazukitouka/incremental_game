extends Button

@export var weapon: Weapon:
	set(value):
		weapon = value
		update_button_label()


func _ready() -> void:
	weapon.level_changed.connect(update_button_label)
	pressed.connect(upgrade_weapon)


func update_button_label() -> void:
	text = 'Level {level} {name} ({cost})'.format({
		level = weapon.level,
		name = weapon.name,
		cost = weapon.upgrade_cost()
	})


func upgrade_weapon() -> void:
	GameData.upgrade_weapon(weapon)
