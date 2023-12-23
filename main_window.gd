extends Control

var wishlist_text = ":foxwow:"
var demo_text = ":fox+1:"
var interesting_text = ":foxhmmm:"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_copy_to_clipboard_pressed():
	if len($Panel/MarginContainer/VBoxContainer/Name/LineEdit.text) <= 0:
		DisplayServer.clipboard_set("clipboard app: Invalid name")
		return
	if len($Panel/MarginContainer/VBoxContainer/Link/LineEdit.text) <= 0:
		DisplayServer.clipboard_set("clipboard app: Invalid link")
		return
	var string_lines = []
	string_lines.append("**"+$Panel/MarginContainer/VBoxContainer/Name/LineEdit.text+"**")
	if $Panel/MarginContainer/VBoxContainer/Tags/Wishlisted/CheckBox.button_pressed:
		string_lines.append("Wishlisted: "+ wishlist_text)
	if $Panel/MarginContainer/VBoxContainer/Tags/DemoAvailable/CheckBox.button_pressed:
		string_lines.append("Demo Available: "+ demo_text)
	if $Panel/MarginContainer/VBoxContainer/Tags/Interesting/CheckBox.button_pressed:
		string_lines.append("Interesting: " + interesting_text)
	string_lines.append($Panel/MarginContainer/VBoxContainer/Link/LineEdit.text)
	DisplayServer.clipboard_set('\n'.join(string_lines))
