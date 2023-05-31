extends Node2D

@export var boss: Node2D
@export var weapon: Weapon

const finger_scene := preload('res://scenes/effects/finger.tscn')
const damage_number_scene := preload('res://scenes/damage_number.tscn')


func _ready() -> void:
	boss.hit.connect(deal_damage)


func deal_damage(click_position: Vector2) -> void:
	var finger := finger_scene.instantiate()
	finger.global_position = click_position
	get_parent().add_child(finger)

	var damage := weapon.level
	var damage_number := damage_number_scene.instantiate()
	add_child(damage_number)
	damage_number.damage = damage
	damage_number.global_position = click_position
	GameData.experience += damage
