extends Node2D

const weapon_button_scene := preload('res://scenes/weapon_button.tscn')

@onready var boss: Area2D = $Boss
@onready var experience_label: Label = %ExperienceLabel
@onready var weapons_container: VBoxContainer = %VBoxContainer


func _ready() -> void:
	add_weapon_scenes()
	add_weapon_buttons()
	GameData.experience_changed.connect(update_experience_label)


func add_weapon_scenes() -> void:
	add_weapon_scene(GameData.manual_weapon)
	for weapon in GameData.weapons:
		add_weapon_scene(weapon)


func add_weapon_scene(weapon_data) -> void:
	var weapon = weapon_data.weapon_scene.instantiate()
	weapon.boss = boss
	weapon.weapon = weapon_data
	add_child(weapon)


func add_weapon_buttons() -> void:
	add_weapon_button(GameData.manual_weapon)
	for weapon in GameData.weapons:
		add_weapon_button(weapon)


func add_weapon_button(weapon: Weapon) -> void:
	var weapon_button = weapon_button_scene.instantiate()
	weapon_button.weapon = weapon
	weapons_container.add_child(weapon_button)


func update_experience_label(experience) -> void:
	experience_label.text = str(experience)

