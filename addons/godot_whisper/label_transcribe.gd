extends RichTextLabel

func _ready():
	custom_minimum_size.x = 400
	bbcode_enabled = true
	fit_content = true

func update_text():
	text = completed_text + "[color=green]" + partial_text + "[/color]"

func _process(_delta):
	update_text()

var completed_text := ""
var partial_text := ""

func _on_speech_to_text_transcribed_msg(is_partial, new_text):
	if is_partial == true:
		completed_text += new_text
		partial_text = ""
	else:
		if new_text!="":
			partial_text = new_text
