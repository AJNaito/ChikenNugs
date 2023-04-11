/// @description Prepare Interaction
// You can write your code in this editor
whole_interaction = ""
pos_y = y
t = 0

if (interaction != "") {
	if (ds_list_size(interaction_history) >= 10) {
		history_length -= string_length(ds_list_find_value(interaction_history, 0))
		ds_list_delete(interaction_history, 0)
	}
	char = history_length + 2 *  ds_list_size(interaction_history)
	
	for (var i = 0; i < ds_list_size(interaction_history); i++) {
		whole_interaction += ds_list_find_value(interaction_history, i) + "\n\n"
		show_debug_message( string_count("\n",ds_list_find_value(interaction_history, i)))
		
		pos_y -= charHeight * string_count("\n", ds_list_find_value(interaction_history, i))
	}
	
	ds_list_add(interaction_history, interaction)
	history_length += string_length(interaction)
	whole_interaction += interaction
}