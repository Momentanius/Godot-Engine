extends Node2D

var count = 0;
var story

func _ready():
	story = get_from_json("story.json")
	$BackgroundCave/ChatBox/CharacterName.text = story[count]["personagem"]
	$BackgroundCave/ChatBox/ChatText.text = story[count]["dialogo"]

func get_from_json(filename):
	var file = File.new() # the file object
	file.open(filename, File.READ) #assumes the file exists
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close() #lembre-se de fechar os arquivos
	return data


func _on_Button_pressed():
	count +=1
	if count < story.size():
		$BackgroundCave/ChatBox/CharacterName.text = story[count]["personagem"]
		$BackgroundCave/ChatBox/ChatText.text = story[count]["dialogo"]
	else:
		$BackgroundCave/ChatBox/CharacterName.text = "Narrador"
		$BackgroundCave/ChatBox/ChatText.text = "E todo mundo morreu. Acabo."
