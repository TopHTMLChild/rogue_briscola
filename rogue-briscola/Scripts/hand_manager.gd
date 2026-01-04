extends Node2D

var deck = [1,2,3,4,5,6,7,8,9,10]
var hand_size = 3
var card = preload("res://cards/card.tscn")
var card_script = preload("res://Scripts/card.gd")
var deck_script = preload("res://Scripts/deck_node.gd")

@onready var hand_starting_point = $"../Marker2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deck.shuffle()
	print(deck)


func draw_card(current_card):
	var hand_offset_x = Vector2(210,0)
	var new_card = card.instantiate()
	
	var card_value = deck.pop_at(0)
	new_card.value = card_value
	
	if current_card == 0:	
		new_card.position = hand_starting_point.global_position
	if current_card == 1:
		new_card.position = hand_starting_point.global_position + hand_offset_x
	if current_card == 2:
		new_card.position = hand_starting_point.global_position + (hand_offset_x*2)
		
		
		
	get_tree().current_scene.add_child(new_card)

func draw_hand():
	for current_card in range(hand_size):
		draw_card(current_card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		draw_hand()
