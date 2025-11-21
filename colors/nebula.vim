" colors/nebula-lilac.vim
" Alternate name for the scheme; reuses the same Lua module.
if has('nvim')
  if exists('g:colors_name')
    unlet g:colors_name
  endif
  let g:colors_name = "nebula"
  lua << EOF
  local ok, nebula = pcall(require, "nebula")
  if not ok then
    vim.api.nvim_err_writeln("nebula colorscheme: failed to load Lua module 'nebula'")
  else
    nebula.setup()
    nebula.apply()
  end
EOF
else
  echoerr "nebula: nvim required"
endif
