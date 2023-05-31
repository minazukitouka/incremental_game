extends Node2D

@export var boss: Node2D
@export var weapon: Weapon

const slash_scene := preload('res://scenes/effects/slash.tscn')
const damage_number_scene := preload('res://scenes/damage_number.tscn')

@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(deal_damage)


func deal_damage() -> void:
	if weapon.level == 0:
		return

	var slash := slash_scene.instantiate()
	var attack_position = Vector2(
		randf_range(-100, 100),
		randf_range(-200, 200),
	)
	slash.global_position = attack_position
	get_parent().add_child(slash)

	var damage := weapon.level * 10
	var damage_number := damage_number_scene.instantiate()
	add_child(damage_number)
	damage_number.damage = damage
	damage_number.global_position = attack_position
	GameData.experience += damage
