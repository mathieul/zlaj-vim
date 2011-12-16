" font
set guifont=Meslo\ LG\ S\ DZ:h13

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
  " remap File new shortcut so we can reuse it later
  macmenu &File.New\ Tab key=<D-T>
end

" mapping keys
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>
