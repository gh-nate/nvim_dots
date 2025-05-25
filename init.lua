-- Copyright (c) 2025 gh-nate
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

vim.keymap.set('n', 'q', '')
vim.keymap.set('n', 'K', '')

vim.o.shada = ''
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false

-- From $VIMRUNTIME/example_init.lua
-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({'git', 'blame', '-L', line_number .. ',+1', filename}))
end, {desc = 'Print the git blame for the current line'})

for _, path in pairs({'vim/vimfiles/plugin', 'doc/fzf/examples'}) do
  local fzf_vim = '/usr/share/' .. path .. '/fzf.vim'
  if vim.uv.fs_stat(fzf_vim) then
    vim.cmd.source(fzf_vim)
  end
end

vim.cmd.runtime('local.lua')
