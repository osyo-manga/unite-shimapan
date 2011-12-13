scriptencoding utf-8

function! unite#sources#shimapan#define()
  return s:source
endfunction

let s:source = {
\	"name" : "shimapan",
\	"syntax" : "uniteSource__shimapan",
\	"hooks" : {}
\}

function! s:source.gather_candidates(args, context)
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

function! s:source.hooks.on_syntax(args, context)
	syntax match shimapan_blue /b/ containedin=uniteSource__shimapan contained
	syntax match shimapan_white /w/ containedin=uniteSource__shimapan contained

	highlight shimapan_blue ctermbg=cyan ctermfg=cyan guibg=cyan guifg=cyan
	highlight shimapan_white ctermfg=white ctermbg=white guifg=white guibg=white
endfunction

