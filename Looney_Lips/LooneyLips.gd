extends Node2D

var player_words = [] # words that the player will type
#Isso se chama dictionary. Eles são criados com { e são semelhantes a JSONs. 
var current_story
var strings # all the text that's going to be shown to the player.

func _ready():
	set_random_story()
	strings = get_from_json("other_strings.json")
	$Blackboard/TextBox.grab_focus()
	$Blackboard/StoryText.text = strings["intro"] + " "
	prompt_player()
	
	# O $ funciona como um atalho para get_node("Blackboard/StoryText")
#	$Blackboard/StoryText.bbcode_text = story % prompt;
	$Blackboard/TextBox.text = ""

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)


func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	$Blackboard/StoryText.text = ""
	check_player_word_lenght()

func prompt_player():
	var next_prompt = current_story["prompt"][player_words.size()]
	$Blackboard/StoryText.text += (strings["prompt"] % next_prompt)
	

func set_random_story():
	var stories = get_from_json("stories.json")
	randomize()
	current_story = stories[randi() % stories.size()]
	pass

func get_from_json(filename):
	var file = File.new() # the file object
	file.open(filename, File.READ) #assumes the file exists
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close() #lembre-se de fechar os arquivos
	return data
	

func is_story_done():
	return player_words.size() == current_story.prompt.size()

func check_player_word_lenght():
	if is_story_done():
		tell_story()
		$Blackboard/TextureButton/ButtonLabel.text = "Again"
	else:
		prompt_player()
	

# story % player_words faz ele selecionar o próximo valor em um array automaticamente.
func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	$Blackboard/TextureButton/ButtonLabel.text = strings["again"]
	end_game()

#Queue Free remove um nó da cena. Excelente para remover elementos quanto eles estiverem prontos.
func end_game():
	$Blackboard/TextBox.queue_free()
	pass