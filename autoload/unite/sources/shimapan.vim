scriptencoding utf-8

function! unite#sources#shimapan#define()
  return s:source
endfunction

let s:source = {
\	"name" : "shimapan",
\	"syntax" : "uniteSource_shimapan"
\}

function! s:source.gather_candidates(args, context)
" 	let b:unite_cursor_line_highlight="Normal"
	let space_size = 2
	let width = winwidth(winnr("$"))-10
	let height = width / (space_size*2)
	let result = g:unite_cursor_line_highlight == "Normal" ? [] : ['']
	let step = 2
	for n in range(0, height)
		let color = n / step % step == 0 ? "b" : "w"
		let space = join(map(range(0, n * space_size), "' '"), "")
		let result = result + [space.join(map(range(0, width-n*space_size*2), "color"), "")]
	endfor
	return map(result, "{'word' : v:val, 'is_dummy' : 1}")
endfunction
