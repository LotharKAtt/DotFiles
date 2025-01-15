-- Return to the same line when reopening a file
if vim.fn.has("autocmd") == 1 then
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      local last_position = vim.fn.line("'\"")
      if last_position > 1 and last_position <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
      end
    end,
  })
end

-- Set the highlight for trailing whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "darkred", bg = "darkred" })

-- Autocommand to highlight trailing whitespace in all buffers
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end,
})
