// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function import_json(_fileName, _func){
	if (file_exists(_fileName)) {
		var _file, json_string
		_file = file_text_open_read(_fileName)
		json_string = ""
		
		while (!file_text_eof(_file)) {
			json_string += file_text_read_string(_file)
			file_text_readln(_file)
		}
		file_text_close(_file)
		return script_execute(_func, json_string)
	}
	return undefined
}