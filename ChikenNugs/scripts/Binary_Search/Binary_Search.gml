// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Binary_Search(element, commands){
	var lo, hi
	lo = 0;
	hi = ds_list_size(commands);
	
	while (lo < hi) {
		var mid = floor((lo + hi)/2);
		
		var command = ds_list_find_value(commands, mid)
		if (command == element) {
			return command
		} else if (command < element) {
			lo = mid + 1
		} else {
			hi = mid - 1
		}
	}
	
	// last check
	if (ds_list_find_value(commands, lo) == "help")
		return "help"
	
	return false;
}