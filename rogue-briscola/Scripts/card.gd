extends Node2D

var value : int
var cards_path = "res://Assets/carte_napolentane_PNG/"
var file_names: Array[String] = []
@onready var sprite = $Sprite2D

func get_file_names() -> void:
	var dir := DirAccess.open(cards_path)
	if dir:
		dir.list_dir_begin()
		var file_name := dir.get_next()
		
		while file_name != "":
			if not dir.current_is_dir():
				file_names.append(file_name)
			file_name = dir.get_next()
		
		dir.list_dir_end()
		#print(file_names)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_file_names()
	
	#var deck_seed = "bastoni"
	#var deck_seed = "coppe"
	#var deck_seed = "denara"
	var deck_seed = "spade"
	
	if file_names.has(deck_seed + str(value) + ".png"):
		var folder_path = "res://Assets/carte_napolentane_PNG/"
		var file_path = folder_path + deck_seed + str(value) + ".png"
		var texture = load(file_path)
		sprite.texture = texture
	else:
		print("WTF THAT SHUOLDNT BE POSSIBLE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
