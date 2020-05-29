extends Control

var player_words = []	
var current_story = {}

#	{
#	"prompts": ["a name","a title","a place","a verb","a noun"],
#	"story": "In the far future %s the %s of %s decided that the best way to control the populace was to %s the %s."
#	},
#	{
#	"prompts": ["a place","a name","a verb","a noun","a verb"],
#	"story": "In the quaint town of %s the great %s boldy %s to the impeccably named %s and then %s all over town."
#	}
#	]


onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var TextDisplay = $VBoxContainer/TextDisplay

	

func _ready():
	set_current_story()
	TextDisplay.text = "Welcome to Loony Lips enter words get story! "
	check_player_words_length()
	PlayerText.grab_focus()
	
func set_current_story():
	randomize()
	var stories = $StoryBook.get_child_count()
	var selected_story = randi() % stories
	current_story.prompts = $StoryBook.get_child(selected_story).prompts
	current_story.story = $StoryBook.get_child (selected_story).story
#	current_story = current_story[randi() % current_story.size()]

func _on_PlayerText_text_entered():
	add_to_player_words()
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	
func update_DisplayText():
	add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	TextDisplay.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()
		
func tell_story():
	TextDisplay.text = current_story.story % player_words
	
	
func prompt_player():
	TextDisplay.text += "May I have " + current_story.prompts[player_words.size()] + " please?"
		
		
func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = "Again!"
	tell_story()


